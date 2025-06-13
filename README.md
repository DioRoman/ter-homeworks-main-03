# ter-homeworks-main-03

Задание 1

cd /mnt/c/Users/rlyst/Netology/ter-homeworks-main-03/src

terraform apply -auto-approve

terraform destroy -auto-approve

sudo mount -t drvfs C:\Users\Dio /mnt/Dio 

Задание 7

{
  network_id = "enp7i560tb28nageq0cc"
  subnet_ids = concat(slice(["e9b0le401619ngf4h68n", "e2lbar6u8b2ftd7f5hia", "b0ca48coorjjq93u36pl", "fl8ner8rjsio6rcpcf0h"], 0, 2), slice(["e9b0le401619ngf4h68n", "e2lbar6u8b2ftd7f5hia", "b0ca48coorjjq93u36pl", "fl8ner8rjsio6rcpcf0h"], 3, 4))
  subnet_zones = concat(slice(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], 0, 2), slice(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], 3, 4))
}

или более короткий вариант через переменные

{
  network_id = "enp7i560tb28nageq0cc"
  subnet_ids = concat(slice(var.subnet_ids, 0, 2), slice(var.subnet_ids, 3, length(var.subnet_ids)))
  subnet_zones = concat(slice(var.subnet_zones, 0, 2), slice(var.subnet_zones, 3, length(var.subnet_zones)))
}

Задание 8

[webservers]
%{~ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"] platform_id=${i["platform_id "]}}
%{~ endfor ~}

Несоответствие названий переменных:
В секции [webservers] используется webservers, а в цикле %{~ for i in webservers ~} — webservers (с одной r).
Ошибка: Если в данных переменная называется webservers, то цикл должен быть %{~ for i in webservers ~}.

Лишний пробел в platform_id:
В строке ${i["platform_id "]} есть лишний пробел перед закрывающей кавычкой.
Должно быть: ${i["platform_id"]}

Пропущена закрывающая фигурная скобка } после nat_ip_address:
В строке ansible_host=${i["network_interface"][0]["nat_ip_address"] нет закрывающей }.

Задание 9

locals {
  rc_list_filtered = [
    for i in range(1, 97) : format("rc%02d", i)
    if !contains([0, 7, 8, 9], i % 10) || i == 19
  ]
}