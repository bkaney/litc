require File.dirname(__FILE__) + '/helper'
 
class TestLitc < Test::Unit::TestCase


  context "urlize helper" do
    
    should "urlize, general case" do
      assert_equal "hello-world", Litc.urlize(:hello_world)
    end

    should "urlize, special cases" do
      assert_equal "block-device-mapping/", Litc.urlize(:block_device_mapping)
      assert_equal "block-device-mapping/foo", Litc.urlize(:block_device_mapping_foo)
      assert_equal "block-device-mapping/swap", Litc.urlize(:block_device_mapping_swap)

      assert_equal "placement/",  Litc.urlize(:placement)
      assert_equal "placement/availability-zone", Litc.urlize(:placement_availability_zone)

      assert_equal "public-keys/", Litc.urlize(:public_keys)
    end

  end

  context "instance metadata" do

    should "get ami_id" do
      assert_equal response_for(:ami_id), Litc.get(:ami_id)
      assert_equal response_for(:ami_id), Litc.ami_id
    end

    should "get ami_launch_index" do
      assert_equal response_for(:ami_launch_index), Litc.get(:ami_launch_index)
      assert_equal response_for(:ami_launch_index), Litc.ami_launch_index
    end

    should "get ami_manifest_path" do
      assert_equal response_for(:ami_manifest_path), Litc.get(:ami_manifest_path)
      assert_equal response_for(:ami_manifest_path), Litc.ami_manifest_path
    end

    should "get block-device-mapping" do
      assert_equal response_for(:block_device_mapping), Litc.get(:block_device_mapping)
      assert_equal response_for(:block_device_mapping), Litc.block_device_mapping
    end

    should "get block-device-mapping-ami" do
      assert_equal response_for(:block_device_mapping_ami), Litc.get(:block_device_mapping_ami)
      assert_equal response_for(:block_device_mapping_ami), Litc.block_device_mapping_ami
    end

    should "get block-device-mapping-ephemeral0" do
      assert_equal response_for(:block_device_mapping_ephemeral0), Litc.get(:block_device_mapping_ephemeral0)
      assert_equal response_for(:block_device_mapping_ephemeral0), Litc.block_device_mapping_ephemeral0
    end

    should "get block-device-mapping-root" do
      assert_equal response_for(:block_device_mapping_root), Litc.get(:block_device_mapping_root)
      assert_equal response_for(:block_device_mapping_root), Litc.block_device_mapping_root
    end

    should "get block-device-mapping-swap" do
      assert_equal response_for(:block_device_mapping_swap), Litc.get(:block_device_mapping_swap)
      assert_equal response_for(:block_device_mapping_swap), Litc.block_device_mapping_swap
    end

    should "get hostname" do
      assert_equal response_for(:hostname), Litc.get(:hostname)
      assert_equal response_for(:hostname), Litc.hostname
    end

    should "get instance-id" do
      assert_equal response_for(:instance_id), Litc.get(:instance_id)
      assert_equal response_for(:instance_id), Litc.instance_id
    end

    should "get instance-type" do
      assert_equal response_for(:instance_type), Litc.get(:instance_type)
      assert_equal response_for(:instance_type), Litc.instance_type
    end

    should "get local-hostname" do
      assert_equal response_for(:local_hostname), Litc.get(:local_hostname)
      assert_equal response_for(:local_hostname), Litc.local_hostname
    end

    should "get local-ipv4" do
      assert_equal response_for(:local_ipv4), Litc.get(:local_ipv4)
      assert_equal response_for(:local_ipv4), Litc.local_ipv4
    end

    should "get placement" do
      assert_equal response_for(:placement), Litc.get(:placement)
      assert_equal response_for(:placement), Litc.placement
    end

    should "get placement-availability-zone" do
      assert_equal response_for(:placement_availability_zone), Litc.get(:placement_availability_zone)
      assert_equal response_for(:placement_availability_zone), Litc.placement_availability_zone
    end

    should "get public-hostname" do
      assert_equal response_for(:public_hostname), Litc.get(:public_hostname)
      assert_equal response_for(:public_hostname), Litc.public_hostname
    end

    should "get public-ipv4" do
      assert_equal response_for(:public_ipv4), Litc.get(:public_ipv4)
      assert_equal response_for(:public_ipv4), Litc.public_ipv4
    end

    should "get public-keys" do
      assert_equal response_for(:public_keys), Litc.get(:public_keys)
      assert_equal response_for(:public_keys), Litc.public_keys
    end

    should "get reservation-id" do
      assert_equal response_for(:reservation_id), Litc.get(:reservation_id)
      assert_equal response_for(:reservation_id), Litc.reservation_id
    end

    should "get security-groups" do
      assert_equal response_for(:security_groups), Litc.get(:security_groups)
      assert_equal response_for(:security_groups), Litc.security_groups
    end

    should "get user-data" do
      assert_equal response_for(:user_data), Litc.get(:user_data)
      assert_equal response_for(:user_data), Litc.user_data
    end

  end

end
