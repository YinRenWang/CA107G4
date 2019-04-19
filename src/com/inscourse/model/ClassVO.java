package com.inscourse.model;

import java.io.Serializable;

public class ClassVO implements Serializable {
	private String classId;
	private String className;
	private String gradeId;

	public ClassVO() {
		super();
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

}
