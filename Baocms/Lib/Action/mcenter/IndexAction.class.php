<?php
class IndexAction extends CommonAction{
    public function index(){
    echo "jjjjj";die;
        $this->display();
    }
    public function coderefund($code_id){
        $code_id = (int) $code_id;
        if ($detail = D('Tuancode')->find($code_id)) {
            if ($detail['user_id'] != $this->uid) {
                $this->baoError('非法操作');
            }
            if ($detail['status'] != 0 || $detail['is_used'] != 0) {
                $this->baoError('该团购券不能申请退款');
            }
            if (!empty($detail)) {
				D('Tuanorder')->save(array('order_id' => $detail['order_id'], 'status' => 3));
				D('Tuancode')->save(array('code_id' => $code_id, 'status' => 1));
				D('Weixintmpl')->weixin_user_refund_shop($code_id,4);//团购劵申请退款，传订单ID跟类型
                $this->baoSuccess('申请成功！等待网站客服处理！', U('index/index'));
            }
        }
        $this->baoError('操作失败');
    }
    public function delete($code_id = 0){
        //根据团购券id删除
        if (is_numeric($code_id) && ($code_id = (int) $code_id)) {
            $obj = D('Tuancode');
            if (!($detial = $obj->find($code_id))) {
                $this->baoError('该团购券不存在');
            }
            if ($detial['user_id'] != $this->uid) {
                $this->baoError('请不要操作他人的订单');
            }
            if ($detial['status'] == 1) {
                $this->baoError('该团购券暂时不能删除');
            }
            if ($detial['status'] == 0) {
                if ($detial['is_used'] == 0) {
                    $this->baoError('该团购券暂时不能删除');
                }
            }
            $obj->save(array('code_id' => $code_id, 'closed' => 1));
			D('Weixintmpl')->weixin_delete_order_shop($code_id,4);//团购劵取消订单，传订单ID跟类型
            $this->baoSuccess('删除成功！', U('index/index'));
        } else {
            $this->baoError('请选择要删除的团购券');
        }
    }
}