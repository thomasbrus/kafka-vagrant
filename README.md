# Kafka vagrant

#### Installation

* Create and provision the virtual machine

  ```bash
  vagrant up
  ```

* Verify that Zookeeper and Kafka instances are running

  ```bash
  vagrant ssh zookeeper
  sudo service zookeeper status
  ```

  ```bash
  vagrant ssh kafka1
  sudo service kafka status
  ```

  ```bash
  vagrant ssh kafka2
  sudo service kafka status
  ```

  ```bash
  vagrant ssh kafka3
  sudo service kafka status
  ```
