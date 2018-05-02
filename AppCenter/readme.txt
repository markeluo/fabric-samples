1.修改orderer节点配置 192.168.0.11
    1.1.修改toml文件
        #   cd /etc/confd/conf.d/
        #   vim crypto-config.yaml.toml
        #   vim docker-compose-orderer.yaml.toml
        #   vim scpfiletopeer.sh.toml

    1.2.修改tmpl文件
        #   cd /etc/confd/templates/
        #   vim crypto-config.yaml.tmpl
        #   vim docker-compose-orderer.yaml.tmpl
        #   vim scpfiletopeer.sh.tmpl

    1.3.修改e2e_cli 目录下的yaml文件
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
        #   vim configtx.yaml
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/base/
        #   vim docker-compose-base.yaml
    
    1.4.删除e2e_cli 目录下的crypto-config文件夹&清空channel-artifacts和cahome文件夹
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
        #   rm -r crypto-config
        #   rm -r channel-artifacts
        #   mkdir channel-artifacts
        #   rm -r cahome
        #   mkdir cahome
    
    1.5.添加shell命令脚本文件
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
        #   vim generateArtifacts.sh
        #   vim orderer_setup.sh
        #   vim orderer-action.sh
        #   vim ....
    1.6.更改shell 命令脚本权限
        #   chmod a+x generateArtifacts.sh
        #   chmod a+x orderer*.sh

2.修改peer节点配置 192.168.0.12
    2.1.修改toml文件
        #   cd /etc/confd/conf.d/
        #   vim docker-compose-peer.yaml.toml

    2.2.修改tmpl文件
        #   cd /etc/confd/templates/
        #   vim docker-compose-peer.yaml.tmpl

    2.3.修改e2e_cli 目录下的yaml文件
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
        #   vim configtx.yaml
 
    2.4.删除e2e_cli 目录下的crypto-config文件夹、channel-artifacts文件夹 & 清空couchdb文件夹
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
        #   rm -r crypto-config
        #   rm -r channel-artifacts 
        #   rm -r couchdb
        #   mkdir couchdb
    
    1.5.添加shell命令脚本文件
        #   cd /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
        #   vim peer_setup.sh
        #   vim peer-action.sh
        #   vim peer-restart.sh
        #   vim ....

    2.6.更改shell 命令脚本权限
        #   chmod a+x peer*.sh

3.修改client节点配置 192.168.0.8
    2.1.修改toml文件
        #   cd /etc/confd/conf.d/
        #   vim docker-compose-peer.yaml.toml

    2.2.修改tmpl文件
        #   cd /etc/confd/templates/
        #   vim docker-compose-peer.yaml.tmpl


        /etc/hyperledger/fabric/msp/signcerts