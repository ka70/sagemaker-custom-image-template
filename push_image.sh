#!/bin/bash

# 変数設定
REPOSITORY_NAME="smstudio-custom"
ACCOUNT_ID=<ACCOUNT ID>
REGION="ap-northeast-1"
TAG_NAME="latest"

# ECRリポジトリを作成する（リポジトリが既に存在する場合はエラーを無視する）
aws ecr create-repository --repository-name $REPOSITORY_NAME --region $REGION || true

# AWS ECRレジストリにDockerクライアントを認証する
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

if [ $? -ne 0 ]; then
    echo "AWS CLIまたはDockerの認証に失敗しました。AWS CLIとDockerが最新かどうか確認してください。"
    exit 1
fi

# Dockerイメージのビルド
docker build -t $REPOSITORY_NAME .

if [ $? -ne 0 ]; then
    echo "Dockerイメージのビルドに失敗しました。"
    exit 1
fi

# イメージをタグ付けする
docker tag $REPOSITORY_NAME:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY_NAME:$TAG_NAME

if [ $? -ne 0 ]; then
    echo "Dockerイメージのタグ付けに失敗しました。"
    exit 1
fi

# AWSのECRリポジトリにイメージをプッシュする
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY_NAME:$TAG_NAME

if [ $? -eq 0 ]; then
    echo "Dockerイメージのプッシュが成功しました。"
else
    echo "Dockerイメージのプッシュに失敗しました。"
    exit 1
fi
