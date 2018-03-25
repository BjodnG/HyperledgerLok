#!/bin/bash

./cryptogen generate --config=./crypto-config.yaml
sleep 1

export FABRIC_CFG_PATH=$PWD


./configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
sleep 2

export CHANNEL_NAME=mychannel

./configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME
sleep 2

./configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/BusinessOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg BusinessOrgMSP
sleep 2

./configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/PublicOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg PublicOrgMSP






composer card create -p connection-businessorg-only.json -u PeerAdmin -c ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/businessorg.altinn.com/users/Admin@businessorg.altinn.com/msp/signcerts/Admin@businessorg.altinn.com-cert.pem -k ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/businessorg.altinn.com/users/Admin@businessorg.altinn.com/msp/keystore/* -r PeerAdmin -r ChannelAdmin

composer card create -p connection-businessorg.json -u PeerAdmin -c ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/businessorg.altinn.com/users/Admin@businessorg.altinn.com/msp/signcerts/Admin@businessorg.altinn.com-cert.pem -k ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/businessorg.altinn.com/users/Admin@businessorg.altinn.com/msp/keystore/* -r PeerAdmin -r ChannelAdmin

composer card create -p connection-publicorg-only.json -u PeerAdmin -c ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/publicorg.altinn.com/users/Admin@publicorg.altinn.com/msp/signcerts/Admin@publicorg.altinn.com-cert.pem -k ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/publicorg.altinn.com/users/Admin@publicorg.altinn.com/msp/keystore/* -r PeerAdmin -r ChannelAdmin

composer card create -p connection-publicorg.json -u PeerAdmin -c ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/publicorg.altinn.com/users/Admin@publicorg.altinn.com/msp/signcerts/Admin@publicorg.altinn.com-cert.pem -k ~/Hyperledger/fabric-samples/first-network/crypto-config/peerOrganizations/publicorg.altinn.com/users/Admin@publicorg.altinn.com/msp/keystore/* -r PeerAdmin -r ChannelAdmin


composer card import -f PeerAdmin@altinn-network-businessorg-only.card

composer card import -f PeerAdmin@altinn-network-businessorg.card

composer card import -f PeerAdmin@altinn-network-publicorg-only.card

composer card import -f PeerAdmin@altinn-network-publicorg.card

