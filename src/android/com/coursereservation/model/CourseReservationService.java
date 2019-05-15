package android.com.coursereservation.model;

import java.sql.Timestamp;
import java.util.List;

import android.com.inscoursetime.model.InsCourseTimeService;
import android.com.inscoursetime.model.InsCourseTimeVO;
import android.com.member.model.MemberService;
import android.com.member.model.MemberVO;
import android.com.withdrawalrecord.model.WithdrawalRecordVO;



public class CourseReservationService {
	
	private CourseReservationDAO_interface dao;

	public CourseReservationService() {
		dao = new CourseReservationJDBCDAO();

	}
	public CourseReservationVO insertWithMemberWithRecod(String teacherId, String memId, String inscId, String teamId,
			Integer crvStatus, Integer classStatus, Integer tranStatus, Timestamp crvMFD, Timestamp crvEXP,
			String crvLoc, Double crvTotalTime, Double crvTotalPrice,String crvRate,String inscTimeId) {
		
		CourseReservationVO courseReservationVO = new CourseReservationVO();
		
		courseReservationVO.setTeacherId(teacherId);
		courseReservationVO.setMemId(memId);
		courseReservationVO.setInscId(inscId);
		courseReservationVO.setTeamId(teamId);
		courseReservationVO.setCrvStatus(crvStatus);
		courseReservationVO.setClassStatus(classStatus);
		courseReservationVO.setTranStatus(tranStatus);
		courseReservationVO.setCrvMFD(crvMFD);
		courseReservationVO.setCrvEXP(crvEXP);
		courseReservationVO.setCrvLoc(crvLoc);
		courseReservationVO.setCrvTotalTime(crvTotalTime);
		courseReservationVO.setCrvTotalPrice(crvTotalPrice);
		courseReservationVO.setCrvRate(crvRate);
		courseReservationVO.setInscTimeId(inscTimeId);
		
		MemberService memberSvc= new MemberService();
		MemberVO memberVO=memberSvc.getOneMember(memId);
		
		WithdrawalRecordVO withdrawalRecordVO =new WithdrawalRecordVO();
		
		InsCourseTimeService InsCourseTimeSvc= new InsCourseTimeService();
		InsCourseTimeVO insCourseTimeVO =InsCourseTimeSvc.getOneInsCourseTime(inscTimeId);
		
		dao.insertWithMemberWithRecod(courseReservationVO, memberVO, withdrawalRecordVO, insCourseTimeVO);
		return courseReservationVO;

	}
	
	public CourseReservationVO addCourseReservation(String teacherId, String memId, String inscId, String teamId,
			Integer crvStatus, Integer classStatus, Integer tranStatus, Timestamp crvMFD, Timestamp crvEXP,
			String crvLoc, Double crvTotalTime, Double crvTotalPrice,String crvRate) {
		
		CourseReservationVO courseReservationVO = new CourseReservationVO();
		
		courseReservationVO.setTeacherId(teacherId);
		courseReservationVO.setMemId(memId);
		courseReservationVO.setInscId(inscId);
		courseReservationVO.setTeamId(teamId);
		courseReservationVO.setCrvStatus(crvStatus);
		courseReservationVO.setClassStatus(classStatus);
		courseReservationVO.setTranStatus(tranStatus);
		courseReservationVO.setCrvMFD(crvMFD);
		courseReservationVO.setCrvEXP(crvEXP);
		courseReservationVO.setCrvLoc(crvLoc);
		courseReservationVO.setCrvTotalTime(crvTotalTime);
		courseReservationVO.setCrvTotalPrice(crvTotalPrice);
		courseReservationVO.setCrvRate(crvRate);
		dao.insert(courseReservationVO);
		return courseReservationVO;

	}
	public CourseReservationVO update(String teamId,Integer crvStatus,Integer classStatus,Integer transStatus,Double crvScore,String crvRate,String crvId) {
		CourseReservationVO courseReservationVO = new CourseReservationVO();
		
		courseReservationVO.setCrvId(crvId);
		courseReservationVO.setTeamId(teamId);
		courseReservationVO.setCrvStatus(crvStatus);
		courseReservationVO.setClassStatus(classStatus);
		courseReservationVO.setCrvScore(crvScore);
		
		dao.update(courseReservationVO);
		return courseReservationVO;
		
	}
	public List<CourseReservationVO> findByStatus(Integer xxxStatus){
		return dao.findByStatus(xxxStatus);
	}
	
	public List<CourseReservationVO> findByRate(String inscId){
		return dao.findByRate(inscId);
		
	}
	
	public List<CourseReservationVO> findByPrimaryKey(String xxxId){
		return dao.findByPrimaryKey(xxxId);
		
	}
	public List<CourseReservationVO> getAll(){
		return dao.getAll();
		
	}
	
	public void ConfirmCourse(String crvId) {
		dao.updateClassStatus(crvId);
	}

}
