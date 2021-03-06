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
 * The base model interface for the VnmArticleReportEntry service. Represents a row in the &quot;iskools_VnmArticleReportEntry&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This interface and its corresponding implementation {@link com.vietnamobile.model.impl.VnmArticleReportEntryModelImpl} exist only as a container for the default property accessors generated by ServiceBuilder. Helper methods and all application logic should be put in {@link com.vietnamobile.model.impl.VnmArticleReportEntryImpl}.
 * </p>
 *
 * @author duymb
 * @see VnmArticleReportEntry
 * @see com.vietnamobile.model.impl.VnmArticleReportEntryImpl
 * @see com.vietnamobile.model.impl.VnmArticleReportEntryModelImpl
 * @generated
 */
public interface VnmArticleReportEntryModel extends BaseModel<VnmArticleReportEntry>,
	GroupedModel {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. All methods that expect a vnm article report entry model instance should use the {@link VnmArticleReportEntry} interface instead.
	 */

	/**
	 * Returns the primary key of this vnm article report entry.
	 *
	 * @return the primary key of this vnm article report entry
	 */
	public long getPrimaryKey();

	/**
	 * Sets the primary key of this vnm article report entry.
	 *
	 * @param primaryKey the primary key of this vnm article report entry
	 */
	public void setPrimaryKey(long primaryKey);

	/**
	 * Returns the vnm article report entry ID of this vnm article report entry.
	 *
	 * @return the vnm article report entry ID of this vnm article report entry
	 */
	public long getVnmArticleReportEntryId();

	/**
	 * Sets the vnm article report entry ID of this vnm article report entry.
	 *
	 * @param vnmArticleReportEntryId the vnm article report entry ID of this vnm article report entry
	 */
	public void setVnmArticleReportEntryId(long vnmArticleReportEntryId);

	/**
	 * Returns the group ID of this vnm article report entry.
	 *
	 * @return the group ID of this vnm article report entry
	 */
	@Override
	public long getGroupId();

	/**
	 * Sets the group ID of this vnm article report entry.
	 *
	 * @param groupId the group ID of this vnm article report entry
	 */
	@Override
	public void setGroupId(long groupId);

	/**
	 * Returns the company ID of this vnm article report entry.
	 *
	 * @return the company ID of this vnm article report entry
	 */
	@Override
	public long getCompanyId();

	/**
	 * Sets the company ID of this vnm article report entry.
	 *
	 * @param companyId the company ID of this vnm article report entry
	 */
	@Override
	public void setCompanyId(long companyId);

	/**
	 * Returns the user ID of this vnm article report entry.
	 *
	 * @return the user ID of this vnm article report entry
	 */
	@Override
	public long getUserId();

	/**
	 * Sets the user ID of this vnm article report entry.
	 *
	 * @param userId the user ID of this vnm article report entry
	 */
	@Override
	public void setUserId(long userId);

	/**
	 * Returns the user uuid of this vnm article report entry.
	 *
	 * @return the user uuid of this vnm article report entry
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public String getUserUuid() throws SystemException;

	/**
	 * Sets the user uuid of this vnm article report entry.
	 *
	 * @param userUuid the user uuid of this vnm article report entry
	 */
	@Override
	public void setUserUuid(String userUuid);

	/**
	 * Returns the user name of this vnm article report entry.
	 *
	 * @return the user name of this vnm article report entry
	 */
	@AutoEscape
	@Override
	public String getUserName();

	/**
	 * Sets the user name of this vnm article report entry.
	 *
	 * @param userName the user name of this vnm article report entry
	 */
	@Override
	public void setUserName(String userName);

	/**
	 * Returns the create date of this vnm article report entry.
	 *
	 * @return the create date of this vnm article report entry
	 */
	@Override
	public Date getCreateDate();

	/**
	 * Sets the create date of this vnm article report entry.
	 *
	 * @param createDate the create date of this vnm article report entry
	 */
	@Override
	public void setCreateDate(Date createDate);

	/**
	 * Returns the modified date of this vnm article report entry.
	 *
	 * @return the modified date of this vnm article report entry
	 */
	@Override
	public Date getModifiedDate();

	/**
	 * Sets the modified date of this vnm article report entry.
	 *
	 * @param modifiedDate the modified date of this vnm article report entry
	 */
	@Override
	public void setModifiedDate(Date modifiedDate);

	/**
	 * Returns the article ID of this vnm article report entry.
	 *
	 * @return the article ID of this vnm article report entry
	 */
	@AutoEscape
	public String getArticleId();

	/**
	 * Sets the article ID of this vnm article report entry.
	 *
	 * @param articleId the article ID of this vnm article report entry
	 */
	public void setArticleId(String articleId);

	/**
	 * Returns the version of this vnm article report entry.
	 *
	 * @return the version of this vnm article report entry
	 */
	public double getVersion();

	/**
	 * Sets the version of this vnm article report entry.
	 *
	 * @param version the version of this vnm article report entry
	 */
	public void setVersion(double version);

	/**
	 * Returns the title of this vnm article report entry.
	 *
	 * @return the title of this vnm article report entry
	 */
	@AutoEscape
	public String getTitle();

	/**
	 * Sets the title of this vnm article report entry.
	 *
	 * @param title the title of this vnm article report entry
	 */
	public void setTitle(String title);

	/**
	 * Returns the action of this vnm article report entry.
	 *
	 * @return the action of this vnm article report entry
	 */
	@AutoEscape
	public String getAction();

	/**
	 * Sets the action of this vnm article report entry.
	 *
	 * @param action the action of this vnm article report entry
	 */
	public void setAction(String action);

	/**
	 * Returns the status of this vnm article report entry.
	 *
	 * @return the status of this vnm article report entry
	 */
	public int getStatus();

	/**
	 * Sets the status of this vnm article report entry.
	 *
	 * @param status the status of this vnm article report entry
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
	public int compareTo(
		com.vietnamobile.model.VnmArticleReportEntry vnmArticleReportEntry);

	@Override
	public int hashCode();

	@Override
	public CacheModel<com.vietnamobile.model.VnmArticleReportEntry> toCacheModel();

	@Override
	public com.vietnamobile.model.VnmArticleReportEntry toEscapedModel();

	@Override
	public com.vietnamobile.model.VnmArticleReportEntry toUnescapedModel();

	@Override
	public String toString();

	@Override
	public String toXmlString();
}