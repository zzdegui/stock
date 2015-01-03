package com.jrj.payment.dao;

import j.d.XDB;
import j.u.XMap;

import java.math.BigDecimal;

/**
 * @author 作者 Joe
 * @version
 * @date 创建时间：2014-7-30 下午2:03:11
 */
public class PayDb extends XDB {

	@Override
	protected String getPooledConnName() {
		// TODO Auto-generated method stub
		return "pay";
	}
	
	//获得当前用户购物车商品数量
	private static final String GET_CART_FOR_UID = "SELECT CASE WHEN SUM(product_count) IS NULL" +
												   " THEN 0 ELSE SUM(product_count) " +
												   "END AS product_count " +
												   "FROM cart_db.cart " +
												   "WHERE uid = ? AND `status` = 0";
	
	
	/**
	 * 获取用户购物车商品数量
	 */
	public static int getCartCountForUid(String uid){
		PayDb db = new PayDb();
		db.open();
        db.prepareStatement(GET_CART_FOR_UID);
        db.setParameters(uid);
        BigDecimal b = (BigDecimal) db.queryScalar();
        int i=b.intValue();
        db.close();
		return i;
	}
	
	
	private static final String GET_PAY_FOR_ID = "SELECT * FROM t_product WHERE product_id=? ";

	
	public static XMap getPayByid(String product_id) {
        XMap map = new XMap();
        PayDb db = new PayDb();
        db.open();
        db.prepareStatement(GET_PAY_FOR_ID);
        db.setParameters(new Object[]{product_id});
        map = db.querySingleRow();
        db.close();
        return map;
    }

}
