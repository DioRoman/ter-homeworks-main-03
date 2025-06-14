# ter-homeworks-main-03

# Задание 1

![Снимок экрана 2025-06-10 225921](https://github.com/user-attachments/assets/9b749cb0-c063-4500-976a-d7dbb36777de)

# Задание 2

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/count-vm.tf

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/for_each-vm.tf

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/vm.variables.tf

![Снимок экрана 2025-06-11 214659](https://github.com/user-attachments/assets/8cb5987a-8382-4c9d-a594-4070d663b0ec)

# Задание 3

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/disk_vm.tf

# Задание 4

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/ansible.tf 

_(тестировал закомментированную часть, вторая часть еще не протестирована)_

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/ansible.tftpl

![Снимок экрана 2025-06-12 175214](https://github.com/user-attachments/assets/ca040c2a-3850-4fa5-9d54-47753d12c3ea)

# Задание 5

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/outputs.tf

![Снимок экрана 2025-06-12 183606](https://github.com/user-attachments/assets/3430ac56-935c-4a63-bdb7-ac0696b93380) 

_(в задании требовалость только для count и for each_

![Снимок экрана 2025-06-12 184018](https://github.com/user-attachments/assets/9080b248-83ea-4325-b5c1-18e10062d4ff) 

_(но я сделал и для storage)_

# Задание 6

_Не успел, но сделал заготовки._

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/ansible-start.tf

https://github.com/DioRoman/ter-homeworks-main-03/blob/main/src/test.yml

# Задание 7
```
{
  network_id = "enp7i560tb28nageq0cc"
  subnet_ids = concat(slice(["e9b0le401619ngf4h68n", "e2lbar6u8b2ftd7f5hia", "b0ca48coorjjq93u36pl", "fl8ner8rjsio6rcpcf0h"], 0, 2), slice(["e9b0le401619ngf4h68n", "e2lbar6u8b2ftd7f5hia", "b0ca48coorjjq93u36pl", "fl8ner8rjsio6rcpcf0h"], 3, 4))
  subnet_zones = concat(slice(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], 0, 2), slice(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], 3, 4))
}
```
# Задание 8
```
[webservers]
%{~ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"] platform_id=${i["platform_id "]}}
%{~ endfor ~}
```

_Лишний пробел в platform_id:
В строке ${i["platform_id "]} есть лишний пробел перед закрывающей кавычкой.
Должно быть: ${i["platform_id"]}_

_Пропущена закрывающая фигурная скобка } после nat_ip_address:
В строке ansible_host=${i["network_interface"][0]["nat_ip_address"] нет закрывающей }._

# Задание 9
```
locals {
  rc_list_filtered = [
    for i in range(1, 97) : format("rc%02d", i)
    if !contains([0, 7, 8, 9], i % 10) || i == 19
  ]
}
```
