#data "vkcs_compute_keypair" "kp" {
#  name = "pe"
#}

data "vkcs_networking_network" "extnet" {
  name = "ext-net"
}

data "vkcs_images_image" "ubuntu" {
  name        = "learn-pe-lab"
  most_recent = true

  properties = {
    key = "value"
  }
}

data "vkcs_compute_flavor" "flavor" {
  vcpus = 1
  ram   = 1024
}

resource "vkcs_compute_instance" "compute" {
  name              = "vm-${random_string.learn.result}"
  count             = 1  // Требуется указать кол-во ВМ
  flavor_id         = data.vkcs_compute_flavor.flavor.id
  security_groups   = ["permit_all_${random_string.learn.result}"]
  image_id          = data.vkcs_images_image.ubuntu.id
  key_pair          = "pe"
  availability_zone = "MS1"
  user_data         = base64encode(templatefile("${path.module}/user_data.tpl", {
        STORAGE_CONTAINER="${var.STORAGE_CONTAINER}"
        LAB_DEPLOY_TEMPLATES_CS="${var.LAB_DEPLOY_TEMPLATES_CS}"
        STORAGE_ACCOUNT_NAME="${var.STORAGE_ACCOUNT_NAME}"
        LAB_TP_NAME="${var.LAB_TP_NAME}"
        LAB_DEPLOY_PATH="depoy/solution"
        DST_FOLDER="/code"
        lab_assessment_templates_cs="${var.lab_assessment_templates_cs}"
        storage_container_materials="${var.storage_container_materials}"
        lab_assessment_path="${var.lab_assessment_path}"
        lab_tp_name="${var.LAB_TP_NAME}"
        }
      )
    )
  config_drive = true


  block_device {
    uuid                  = data.vkcs_images_image.ubuntu.id
    source_type           = "image"
    destination_type      = "volume"
    volume_type           = "ceph-ssd"
    volume_size           = 20
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid = data.vkcs_networking_network.extnet.id
  }

  depends_on = [
    vkcs_networking_secgroup.secgroup
  ]
}
