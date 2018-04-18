//configuring the google provider
provider "google"{
	credentials = "${file("${path.module}/credentials/<file>.json")}"
	project = "nomad-201510"
	region = "us-east1"
}

//creating a new instance in the google cloud engine

resource "google_compute_instance" "default" {
	name = "nomad-server"
	machine_type = "n1-standard-1"
	zone = "us-east1-b"


tags = ["nomad","server"]

disk{
			image="ubuntu-1604-lts"
			size  = "10"
	}

network_interface{
	network = "default"


access_config{
//public ip
}
}
service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
