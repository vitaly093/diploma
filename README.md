# diploma
netology_diploma


![image](https://user-images.githubusercontent.com/60869933/197367658-50bf07e3-5410-48d4-8d8e-5df268f4b69c.png)

![image](https://user-images.githubusercontent.com/60869933/197367663-9b1e24ac-4a07-438a-adcf-52424016011f.png)

![image](https://user-images.githubusercontent.com/60869933/197425630-f3a37b94-f9ff-41a8-a5b6-84a52be94c2c.png)

![image](https://user-images.githubusercontent.com/60869933/197425643-1c1892d0-e8bb-4ced-ac2a-78c6c2186e28.png)


stages:
  - deploy

sync:
  stage: deploy
  script: rsync -rult --delete-after --exclude=.git/ --exclude=.gitlab-ci.yml --password-file=/etc/rsyncd.scrt $CI_PROJECT_DIR/ rsync_wordpress@192.168.100.15::wordpress

![image](https://user-images.githubusercontent.com/60869933/197615112-796308fc-d6a0-4142-a706-4aa40c0d2016.png)

![image](https://user-images.githubusercontent.com/60869933/197616529-2cb07e33-164e-42be-8b3a-96da73c02e45.png)
