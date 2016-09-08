# Kafka vagrant

#### Installation

* Create and provision the virtual machine

  ```bash
  vagrant up
  ```

* Verify that Zookeeper and Kafka are running

  ```bash
  vagrant ssh
  sudo service zookeeper status
  sudo service kafka status
  ```
