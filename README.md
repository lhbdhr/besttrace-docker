# 使用教程

```bash
# 构建镜像并上传到 docker hub
docker buildx build . --platform linux/arm64,linux/386 -t lhbdhr/besttrace:1.0 -t lhbdhr/besttrace:latest --push

# 使用方法
docker run --rm lhbdhr/besttrace 8.8.8.8
```
