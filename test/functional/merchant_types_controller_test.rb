require 'test_helper'

class MerchantTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => MerchantType.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    MerchantType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    MerchantType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to merchant_type_url(assigns(:merchant_type))
  end

  def test_edit
    get :edit, :id => MerchantType.first
    assert_template 'edit'
  end

  def test_update_invalid
    MerchantType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MerchantType.first
    assert_template 'edit'
  end

  def test_update_valid
    MerchantType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MerchantType.first
    assert_redirected_to merchant_type_url(assigns(:merchant_type))
  end

  def test_destroy
    merchant_type = MerchantType.first
    delete :destroy, :id => merchant_type
    assert_redirected_to merchant_types_url
    assert !MerchantType.exists?(merchant_type.id)
  end
end
