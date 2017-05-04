/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.vietnamobile.model;

import com.liferay.portal.kernel.bean.AutoEscape;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.model.CacheModel;
import com.liferay.portal.model.GroupedModel;
import com.liferay.portal.service.ServiceContext;

import com.liferay.portlet.expando.model.ExpandoBridge;

import java.io.Serializable;

import java.util.Date;

/**
 * The base model interface for the SubjectEntry service. Represents a row in the &quot;iskools_SubjectEntry&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This interface and its corresponding implementation {@link com.vietnamobile.model.impl.SubjectEntryModelImpl} exist only as a container for the default property accessors generated by ServiceBuilder. Helper methods and all application logic should be put in {@link com.vietnamobile.model.impl.SubjectEntryImpl}.
 * </p>
 *
 * @author duymb
 * @see SubjectEntry
 * @see com.vietnamobile.model.impl.SubjectEntryImpl
 * @see com.vietnamobile.model.impl.SubjectEntryModelImpl
 * @generated
 */
public interface SubjectEntryModel extends BaseModel<SubjectEntry>, GroupedModel {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. All methods that expect a subject entry model instance should use the {@link SubjectEntry} interface instead.
	 */

	/**
	 * Returns the primary key of this subject entry.
	 *
	 * @return the primary key of this subject entry
	 */
	public long getPrimaryKey();

	/**
	 * Sets the primary key of this subject entry.
	 *
	 * @param primaryKey the primary key of this subject entry
	 */
	public void setPrimaryKey(long primaryKey);

	/**
	 * Returns the subject entry ID of this subject entry.
	 *
	 * @return the subject entry ID of this subject entry
	 */
	public long getSubjectEntryId();

	/**
	 * Sets the subject entry ID of this subject entry.
	 *
	 * @param subjectEntryId the subject entry ID of this subject entry
	 */
	public void setSubjectEntryId(long subjectEntryId);

	/**
	 * Returns the group ID of this subject entry.
	 *
	 * @return the group ID of this subject entry
	 */
	@Override
	public long getGroupId();

	/**
	 * Sets the group ID of this subject entry.
	 *
	 * @param groupId the group ID of this subject entry
	 */
	@Override
	public void setGroupId(long groupId);

	/**
	 * Returns the company ID of this subject entry.
	 *
	 * @return the company ID of this subject entry
	 */
	@Override
	public long getCompanyId();

	/**
	 * Sets the company ID of this subject entry.
	 *
	 * @param companyId the company ID of this subject entry
	 */
	@Override
	public void setCompanyId(long companyId);

	/**
	 * Returns the user ID of this subject entry.
	 *
	 * @return the user ID of this subject entry
	 */
	@Override
	public long getUserId();

	/**
	 * Sets the user ID of this subject entry.
	 *
	 * @param userId the user ID of this subject entry
	 */
	@Override
	public void setUserId(long userId);

	/**
	 * Returns the user uuid of this subject entry.
	 *
	 * @return the user uuid of this subject entry
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public String getUserUuid() throws SystemException;

	/**
	 * Sets the user uuid of this subject entry.
	 *
	 * @param userUuid the user uuid of this subject entry
	 */
	@Override
	public void setUserUuid(String userUuid);

	/**
	 * Returns the user name of this subject entry.
	 *
	 * @return the user name of this subject entry
	 */
	@AutoEscape
	@Override
	public String getUserName();

	/**
	 * Sets the user name of this subject entry.
	 *
	 * @param userName the user name of this subject entry
	 */
	@Override
	public void setUserName(String userName);

	/**
	 * Returns the create date of this subject entry.
	 *
	 * @return the create date of this subject entry
	 */
	@Override
	public Date getCreateDate();

	/**
	 * Sets the create date of this subject entry.
	 *
	 * @param createDate the create date of this subject entry
	 */
	@Override
	public void setCreateDate(Date createDate);

	/**
	 * Returns the modified date of this subject entry.
	 *
	 * @return the modified date of this subject entry
	 */
	@Override
	public Date getModifiedDate();

	/**
	 * Sets the modified date of this subject entry.
	 *
	 * @param modifiedDate the modified date of this subject entry
	 */
	@Override
	public void setModifiedDate(Date modifiedDate);

	/**
	 * Returns the course of this subject entry.
	 *
	 * @return the course of this subject entry
	 */
	@AutoEscape
	public String getCourse();

	/**
	 * Sets the course of this subject entry.
	 *
	 * @param course the course of this subject entry
	 */
	public void setCourse(String course);

	/**
	 * Returns the subject of this subject entry.
	 *
	 * @return the subject of this subject entry
	 */
	@AutoEscape
	public String getSubject();

	/**
	 * Sets the subject of this subject entry.
	 *
	 * @param subject the subject of this subject entry
	 */
	public void setSubject(String subject);

	/**
	 * Returns the description of this subject entry.
	 *
	 * @return the description of this subject entry
	 */
	@AutoEscape
	public String getDescription();

	/**
	 * Sets the description of this subject entry.
	 *
	 * @param description the description of this subject entry
	 */
	public void setDescription(String description);

	/**
	 * Returns the exam type of this subject entry.
	 *
	 * @return the exam type of this subject entry
	 */
	@AutoEscape
	public String getExamType();

	/**
	 * Sets the exam type of this subject entry.
	 *
	 * @param examType the exam type of this subject entry
	 */
	public void setExamType(String examType);

	/**
	 * Returns the total question of this subject entry.
	 *
	 * @return the total question of this subject entry
	 */
	public int getTotalQuestion();

	/**
	 * Sets the total question of this subject entry.
	 *
	 * @param totalQuestion the total question of this subject entry
	 */
	public void setTotalQuestion(int totalQuestion);

	/**
	 * Returns the status of this subject entry.
	 *
	 * @return the status of this subject entry
	 */
	public int getStatus();

	/**
	 * Sets the status of this subject entry.
	 *
	 * @param status the status of this subject entry
	 */
	public void setStatus(int status);

	@Override
	public boolean isNew();

	@Override
	public void setNew(boolean n);

	@Override
	public boolean isCachedModel();

	@Override
	public void setCachedModel(boolean cachedModel);

	@Override
	public boolean isEscapedModel();

	@Override
	public Serializable getPrimaryKeyObj();

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj);

	@Override
	public ExpandoBridge getExpandoBridge();

	@Override
	public void setExpandoBridgeAttributes(BaseModel<?> baseModel);

	@Override
	public void setExpandoBridgeAttributes(ExpandoBridge expandoBridge);

	@Override
	public void setExpandoBridgeAttributes(ServiceContext serviceContext);

	@Override
	public Object clone();

	@Override
	public int compareTo(com.vietnamobile.model.SubjectEntry subjectEntry);

	@Override
	public int hashCode();

	@Override
	public CacheModel<com.vietnamobile.model.SubjectEntry> toCacheModel();

	@Override
	public com.vietnamobile.model.SubjectEntry toEscapedModel();

	@Override
	public com.vietnamobile.model.SubjectEntry toUnescapedModel();

	@Override
	public String toString();

	@Override
	public String toXmlString();
}