package com.withdrawalrecord.model;

import java.sql.Date;
import java.util.List;

public class WithdrawalRecordService {

	private WithdrawalRecordDAO_interface dao;
	

	public WithdrawalRecordService() {
		dao = new WithdrawalRecordJDBCDAO();
	}

	public WithdrawalRecordVO addWithdrawalRecord(String memid, Integer wrmoney, Date wrtime) {
		WithdrawalRecordVO withdrawalRecordVO = new WithdrawalRecordVO();

		withdrawalRecordVO.setMemid(memid);
		withdrawalRecordVO.setWrmoney(wrmoney);
		withdrawalRecordVO.setWrtime(wrtime);
		dao.insert(withdrawalRecordVO);

		return withdrawalRecordVO;
	}

	public WithdrawalRecordVO updateWithdrawalRecord(String memid, Integer wrmoney, Date wrtime) {
		WithdrawalRecordVO withdrawalRecordVO = new WithdrawalRecordVO();

		withdrawalRecordVO.setMemid(memid);
		withdrawalRecordVO.setWrmoney(wrmoney);
		withdrawalRecordVO.setWrtime(wrtime);
		dao.update(withdrawalRecordVO);

		return withdrawalRecordVO;
	}
//	public void deleteEmp(String withdrawalRecordVO) {
//		dao.delete(withdrawalRecordVO);
//	}

	public WithdrawalRecordVO getOneWithdrawalRecord(String xxxId) {
		return dao.findByPrimaryKey(xxxId);
	}

	public List<WithdrawalRecordVO> getAll() {
		return dao.getAll();
	}
	public List<WithdrawalRecordVO> findByKey(String memId){
		return dao.findByKey(memId);
	}
}
