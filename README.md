# GCPのjupyterlab環境の利用法

## 1. GCPからインスタンスを起動する
- 名前をクリックして詳細からGPU利用かどうかを確認しておくこと（無駄にGPU使うと勿体ない）
- 権限がないとできないのでメアドを自分に送ってください

![image](https://user-images.githubusercontent.com/34390337/216756394-3eb74e1f-b9e1-48b4-92f1-61c20a29e66f.png)


## 2. ssh接続する（ポートフォワーディングもしておく）
- 事前にssh keyの公開鍵を登録する必要があるので自分に送ってください
- ipアドレスも教えるので聞いてください

```
ssh -i ~/.ssh/登録した鍵 user_name@ip_address -L 8888:localhost:8888
```

## 3. 作業環境に移動

```
cd /home/workspace
```

## 4. jupyterlabの起動

cpuのみで動かす場合
```
./run-cpu.sh
```

gpu利用で動かす場合
```
./run-cpu.sh
```

## 5. ブラウザにアクセス

http://localhost:8888/lab

![image](https://user-images.githubusercontent.com/34390337/216756694-ece2f5f2-aad1-4638-ba1d-d2f25ebde7da.png)

備考
```
cuda version 11.3
python 3.8
```
