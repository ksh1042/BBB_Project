package com.bbb.test.dataSource;

import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertEquals;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/bbb/context/dataSource-context.xml")
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
@Transactional
public class SqlSessionTest {
	
	@Autowired
	private SqlSession session;
	
	@Test
	public void sqlSession_Test(){
		Assert.assertThat(session, not( nullValue()));
	}
}
