<%@include file="/html/init.jsp"%>
<%
	themeDisplay =  (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
%>
<c:if test="<%=themeDisplay.isSignedIn()%>">
	<%
		List<Object[]> numberOfQuestion = OnlinetestEntryLocalServiceUtil.getNumberQuestionOfSubject();
	
		String title = renderRequest.getParameter("title");
		int pointOfExam = 100;
		
		String parentCategoryID = GetterUtil.getString(portletPreferences.getValue("parentCategoryID", StringPool.BLANK));
		String configNumberQuestion = GetterUtil.getString(portletPreferences.getValue("configNumberQuestion", StringPool.BLANK));
		
		List<AssetCategory> assetCategoryListCourse = new ArrayList<AssetCategory>();
		assetCategoryListCourse = AssetCategoryLocalServiceUtil.getChildCategories(Integer.parseInt(parentCategoryID));
		
		List<AssetCategory> assetCategoryListSubject = AssetCategoryLocalServiceUtil.getCategories();
		int sizeOfListSubject = assetCategoryListSubject.size();
		
		JSONArray subjectJsonArr = JSONFactoryUtil.createJSONArray();
		for(AssetCategory item: assetCategoryListSubject)
		{
			JSONObject json =  JSONFactoryUtil.createJSONObject();
			json.put("courseID", item.getParentCategoryId());
			json.put("name", item.getName());
			json.put("subjectEntryId",item.getCategoryId());
			subjectJsonArr.put(json);
		}
		String subjectJsonList = subjectJsonArr.toString();
		
		JSONArray numberOfQuestionArr = JSONFactoryUtil.createJSONArray();
		for(Object[] item:numberOfQuestion){
			JSONObject json = JSONFactoryUtil.createJSONObject();
			json.put("subjectID", String.valueOf(item[0]));
			json.put("levelQuestion", String.valueOf(item[1]));
			json.put("totalQuestion", String.valueOf(item[2]));
			numberOfQuestionArr.put(json);
		}
		String numberOfQuestionList = numberOfQuestionArr.toString();
		
		/* List<SubjectEntry> subjectList = new ArrayList<SubjectEntry>();
		subjectList = SubjectEntryLocalServiceUtil.findBySubjectKey(0, "", TESTONLINE, "", true);
		int numberOfSubjects = subjectList.size();
		JSONArray subjectJsonArr = JSONFactoryUtil.createJSONArray();
		for(SubjectEntry item: subjectList)
		{
			JSONObject json =  JSONFactoryUtil.createJSONObject();
			json.put("title", item.getSubject());
			json.put("totalQuestion",item.getTotalQuestion());
			json.put("description",item.getDescription());
			json.put("subjectEntryId",item.getSubjectEntryId());
			subjectJsonArr.put(json);
		}
		String subjectJsonList = subjectJsonArr.toString(); */
		
		//Order By
		String orderByCol = ParamUtil.getString(request, "orderByCol"); 
		String orderByType = ParamUtil.getString(request, "orderByType");
		String sortingOrder = orderByType;
		if(orderByType.equals("desc"))
		{
		    orderByType = "asc";
		}
		else
		{
		    orderByType = "desc";
		} 
		if(Validator.isNull(orderByType))
		{
		    orderByType = "desc";
		}				
	%>
	<%-- <div><%= parentCategoryID + ""+ configNumberQuestion%></div> --%>
	<liferay-portlet:renderURL varImpl="makeExam">
		<portlet:param name="mvcPath" value="/html/questionstore/createTestOnline.jsp" />
	</liferay-portlet:renderURL>
	<liferay-portlet:renderURL varImpl="viewPage">
		<portlet:param name="mvcPath" value="/html/questionstore/view.jsp" />
	</liferay-portlet:renderURL>
	<aui:form action="<%=makeExam%>" method="post" name="fmMakeExam">
		<h4><liferay-ui:message key="function-create-onlinetest"></liferay-ui:message></h4>
		<hr>	
		<aui:row>
			<aui:input inlineField = "true" name="title" label="Title" required="true"></aui:input>	
			<aui:input inlineField="true" type="number" name="pointOfExamHidden" label="pointOfExam" disabled="true" required="true" value = "<%=pointOfExam%>"/>
			<aui:input name="pointOfExam" type="hidden" value = "<%=pointOfExam%>"/>
			
		</aui:row>
		<hr style="border-width: 2px;">
		
		<aui:row>
			<div id="course" style="display: inline-block;">
				<aui:select autofocus="true" id="course1" inlineField="true" name="course1" label= "Course" onChange='fillDetailDate();'>
					<aui:option value="empty" label="PleaseSelectOneSubject" selected="true"></aui:option>	
					<% for (int i = 0; i < assetCategoryListCourse.size(); i++)
					   {
					%>		
					<aui:option value="<%=assetCategoryListCourse.get(i).getCategoryId()%>" label="<%= assetCategoryListCourse.get(i).getName() %>"/>
					<%
					   }
					%>
				</aui:select>
			</div>
			
			<div id="specialSubject-fields">
				<div class="lfr-form-row lfr-form-row-inline">
					<div class="row-fields" style="display: block;">
						<div id="subject" style="display: inline-block;">
							
							<aui:select inlineField="true" name="subject1" id="subject1" label="Subject" required="true" onChange='getNumberQuestion(this);'>
								<aui:option value="empty" label="PleaseSelectOneSubject" selected="true"/>
							</aui:select>
						</div>
						
						<div id="detailSubject1" class="control-group control-group-inline"></div><br>
						
						<aui:input inlineField="true" disabled="true" 
							fieldParam='numberQuestionEachSubjectEasy1'
							id='numberQuestionEachSubjectEasy1' name="numberQuestionEachSubjectEasy1"
							label="numberQuestionEachSubjectEasy" value="0" onChange='validateNumberQuestionEasy();'/>
						<aui:input inlineField="true" disabled="true" 
							fieldParam='numberQuestionEachSubjectNormal1'
							id='numberQuestionEachSubjectNormal1' name="numberQuestionEachSubjectNormal1"
							label="numberQuestionEachSubjectNormal" value="0" onChange='validateNumberQuestionNormal();'/>
						<aui:input inlineField="true" disabled="true" 
							fieldParam='numberQuestionEachSubjectHigh1'
							id='numberQuestionEachSubjectHigh1' name="numberQuestionEachSubjectHigh1"
							label="numberQuestionEachSubjectHigh" value="0" onChange='validateNumberQuestionHigh();'/>
						<aui:input inlineField="true" disabled="true" 
							fieldParam='numberQuestionEachSubjectVeryHigh1'
							id='numberQuestionEachSubjectVeryHigh1' name="numberQuestionEachSubjectVeryHigh1"
							label="numberQuestionEachSubjectVeryHigh" value="0" onChange='validateNumberQuestionVeryHigh();'/>
					</div>
				</div>
			</div>
			<div id="mainShowDetail" class="showDetailSubject">
			</div>
		</aui:row>
		<aui:row>
			<aui:input inlineField="true" name="startDatepicker" id ="startDatepicker" type="text" cssClass="input-small" label="StartDate"/>
			<aui:input inlineField="true" name="startTimepicker" id ="startTimepicker" type="text" placeholder="hh:mm" cssClass="input-mini" label=""/>
			<aui:input inlineField="true" name="endDatepicker" id ="endDatepicker" type="text" cssClass="input-small" label="EndDate"/>
			<aui:input inlineField="true" name="endTimepicker" id ="endTimepicker" type="text" placeholder="hh:mm" cssClass="input-mini" label=""/>
			<aui:input inlineField="true" name="duration" label="Duration" placeholder="Seconds" cssClass="input-mini" value="60"/>
		</aui:row>
		<aui:button type="button" name="btnMakeExam" value="MakeExam" onClick='<%= renderResponse.getNamespace() + "createTestOnline();"%>'/>
		<aui:button type="button" name="btnClose" value="Close" onClick="<%=viewPage.toString()%>"/>		
	</aui:form>
	<hr>
	<liferay-portlet:renderURL varImpl="iteratorURL">
		<portlet:param name="mvcPath" value="/html/questionstore/createTestOnline.jsp" />
	</liferay-portlet:renderURL>
	<liferay-ui:search-container delta="10"  orderByType="<%=orderByType%>" displayTerms="<%= new DisplayTerms(renderRequest)%>" iteratorURL="<%=iteratorURL %>">	
		<liferay-ui:search-container-results>
			<%
			    DisplayTerms displayTerms = searchContainer
			                        .getDisplayTerms();
			                    List<OnlinetestEntry> userList = OnlinetestEntryLocalServiceUtil.getAllOnlinetests();
								List<OnlinetestEntry> sortableList = new ArrayList<OnlinetestEntry>(userList);
								if(Validator.isNotNull(orderByCol))
								{
									if (sortingOrder.equalsIgnoreCase("desc")) 
									{
										Collections.sort(sortableList, new VnmComperatorOnlinetestEntryByColumns(orderByCol));
									}
									else
									{
										Collections.reverse(sortableList);
									}
								}			                    
			                    List<OnlinetestEntry> subLists = ListUtil.subList(
			                    		sortableList, searchContainer.getStart(),
			                            searchContainer.getEnd());
			                    int sizeOf = userList.size();

			                    pageContext.setAttribute("results", subLists);
			                    pageContext.setAttribute("total", sizeOf);
			%>
		</liferay-ui:search-container-results>
		<%
		    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
		%>
		<liferay-ui:search-container-row
			className="com.vietnamobile.model.OnlinetestEntry"
			keyProperty="onlinetestEntryId" modelVar="onlinetestEntry">
			<liferay-ui:search-container-column-text name="onlinetestEntryId"
				value="<%=String.valueOf(onlinetestEntry.getOnlinetestEntryId())%>" />
			<liferay-ui:search-container-column-text orderable="true" name="Title"
				value="<%=onlinetestEntry.getTitle()%>" />			
			<liferay-ui:search-container-column-text name="CreatedBy"
				value="<%=UserLocalServiceUtil.getUserById(onlinetestEntry.getUserId()).getFullName()%>" />
			<liferay-ui:search-container-column-text orderable="true" name="CreateDate"
				value="<%=df.format(onlinetestEntry.getCreateDate())%>" /> 
			<liferay-ui:search-container-column-text orderable="true" name="ModifiedDate"
				value="<%=df.format(onlinetestEntry.getModifiedDate())%>" />
			<liferay-ui:search-container-column-text orderable="true" name="StartExam"
				value="<%=df.format(onlinetestEntry.getTestStartTime())%>" />
			<liferay-ui:search-container-column-text orderable="true" name="EndExam"
				value="<%=df.format(onlinetestEntry.getTestEndTime())%>" />								
			<liferay-ui:search-container-column-jsp
				path="/html/questionstore/actionTestOnline.jsp"
				align="center" />
		</liferay-ui:search-container-row>
		<liferay-ui:search-iterator searchContainer="<%= searchContainer%>" />
	</liferay-ui:search-container>
	<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />createTestOnline',
		function() 
		{
				if (validateNumberQuestion())
				{
				    submitForm(document.<portlet:namespace />fmMakeExam,'<portlet:actionURL name="createTestOnline"></portlet:actionURL>');
				}
		});
	Liferay.provide(
			window,
			'<portlet:namespace />selectSubject',
			function() 
			{
				  AUI().use('aui-node',function(A)
					{
					  	var totalQuestionInfor = A.one('#subjectTotalQuestion');
					});  
			});
	var autoField;
	AUI().use('liferay-auto-fields',
		function(A) 
		{
			autoField = new Liferay.AutoFields(
		          {
		              contentBox: '#specialSubject-fields',
		              fieldIndexes: '<portlet:namespace />rowIndexes'
		          }
		      );
			autoField.on("clone",function(newField)
					{
						// Look up clone
						AUI().one('#specialSubject-fields').all('.lfr-form-row-inline').each(function(node,index)
								{
									if (newField.row.contains(node))
										{
											//console.log(newField);
											//console.log(node);
											var hasDivTag = node.one('[id^="detailSubject"]');
											var nameOfElement = node.one('select').get("name");
											var position = nameOfElement.substr(nameOfElement.length -1);											
											if (hasDivTag)
											{
												node.one('[id^="detailSubject"]').setAttribute("id", "detailSubject" + position);
												node.one('[id^="detailSubject"]').setHTML("");
											}
											else
											{
												var detailDisplayDivTag = document.createElement("div");
												
												detailDisplayDivTag.setAttribute("id", "detailSubject" + position);
												detailDisplayDivTag.setAttribute("class", "control-group control-group-inline");
												node._node.childNodes[1].appendChild(detailDisplayDivTag);
											}
											node.all('.input-text-wrapper').each(function (node2){
												if (node2.one('input'))
												{
													node2.one('input').set('value',0);
													node2.one('input').set('disabled', true);
												}
											});
										}
									
									
								});
								
					});
			autoField.on("delete",function(deleteField)
					{
						AUI().one('#specialSubject-fields').all('.lfr-form-row-inline').each(function(node,index)
								{
									if (deleteField.deletedRow.contains(node))
										{
						                	console.log(deleteField);
										}
								});				
					});
			
			autoField.render();
	    }
	);
	function fillDetailDate()
	{
		var subjectJson =JSON.parse('<%=subjectJsonList%>');
		
		AUI().use('liferay-auto-fields',
				function(A) 
				{
					var course = A.one('#course');
					if(course.one('select')){
						var titleKey = course.one('select').get("value");
						getListSubject(subjectJson, titleKey);
					}
				});
	}
	function getListSubject(subjectJson,titleKey)
	{
		AUI().use('liferay-auto-fields',
		function(A) 
		{
			A.one('#specialSubject-fields').all('.lfr-form-row-inline').each(function (node) {
				var subjectSelect = node.one('select');
				var message = "<liferay-ui:message key='PleaseSelectOneSubject'/>";
				subjectSelect.setHTML('<option value="empty" selected>'+message+'</option>');
				if (titleKey == "empty")
				{
					return 0;
				}
				
				for( i in subjectJson )
				{
					if (subjectJson[i].courseID == titleKey)
					{
						subjectSelect.append('<option value="'+ subjectJson[i].subjectEntryId +'">' + subjectJson[i].name + "</option>");
					}
				}
			});
		});
	}
	function getNumberQuestion(select){
		
		
		var numberOfQuestionJSON = JSON.parse('<%=numberOfQuestionList%>');
		AUI().use('liferay-auto-fields',
				function(A) 
				{
					var selectNode = new A.Node(select);
					selectNode.get('parentNode').get('parentNode').get('parentNode').all('.input-text-wrapper').each(function (node2){
						if (node2.one('input'))
						{
							node2.one('input').set('value',0);
							node2.one('input').set('disabled', true);
						}
					});
					
					A.one('#specialSubject-fields').all('.lfr-form-row-inline').each(function (node) {
						if (node.one('select'))
						{
							var nameOfElement = node.one('select').get("name");
							var titleKey =  node.one('select').get("value");
							var position = nameOfElement.substr(nameOfElement.length -1);
							var showDiv  = A.one('#detailSubject' + position);
							var message = "<liferay-ui:message key='subject-total-infor'/>";
							
							showDiv.setHTML(message + getSubjectDetail(numberOfQuestionJSON, titleKey, position));
						}
					});
				});
	}
	function getSubjectDetail(numberOfQuestionJSON,titleKey, position)
	{
		var message = "";
		var total = 0;
		if (titleKey == "empty")
		{
			return 0;
		}
		for( i in numberOfQuestionJSON )
		{
			if (numberOfQuestionJSON[i].subjectID == titleKey)
			{
				if(numberOfQuestionJSON[i].levelQuestion == "1" ){
					message = message + " <liferay-ui:message key='Easy'/>: " + numberOfQuestionJSON[i].totalQuestion + " |";
					total = total + parseInt(numberOfQuestionJSON[i].totalQuestion);
					AUI().use('liferay-auto-fields',
							function(A) 
							{
								A.one('#<portlet:namespace />numberQuestionEachSubjectEasy' + position).set('disabled', false);
							});
				}
				if(numberOfQuestionJSON[i].levelQuestion == "2" ){
					message = message +  " <liferay-ui:message key='Normal'/>: " + numberOfQuestionJSON[i].totalQuestion + " |";
					total = total + parseInt(numberOfQuestionJSON[i].totalQuestion);
					AUI().use('liferay-auto-fields',
							function(A) 
							{
								A.one('#<portlet:namespace />numberQuestionEachSubjectNormal' + position).set('disabled', false);
							});
				}
				if(numberOfQuestionJSON[i].levelQuestion == "3" ){
					message = message +  " <liferay-ui:message key='High'/>: " + numberOfQuestionJSON[i].totalQuestion + " |";
					total = total + parseInt(numberOfQuestionJSON[i].totalQuestion);
					AUI().use('liferay-auto-fields',
							function(A) 
							{
								A.one('#<portlet:namespace />numberQuestionEachSubjectHigh' + position).set('disabled', false);
							});
				}
				if(numberOfQuestionJSON[i].levelQuestion == "4" ){
					message = message +  " <liferay-ui:message key='veryHigh'/>: " + numberOfQuestionJSON[i].totalQuestion + " |";
					total = total + parseInt(numberOfQuestionJSON[i].totalQuestion);
					AUI().use('liferay-auto-fields',
							function(A) 
							{
								A.one('#<portlet:namespace />numberQuestionEachSubjectVeryHigh' + position).set('disabled', false);
							});
				}
			}
		}
		return message + " <liferay-ui:message key='total'/>: " + total;
	}
	function validateNumberQuestionEasy(){
		checkValidateNumberQuestion(1);
	}
	function validateNumberQuestionNormal(){
		checkValidateNumberQuestion(2);
	}
	function validateNumberQuestionHigh(){
		checkValidateNumberQuestion(3);
	}
	function validateNumberQuestionVeryHigh(){
		checkValidateNumberQuestion(4);
	}
	function checkValidateNumberQuestion(levelQuestion){
		var numberOfQuestionJSON = JSON.parse('<%=numberOfQuestionList%>');
		AUI().use('liferay-auto-fields',
				function(A) 
				{
					A.one('#specialSubject-fields').all('.lfr-form-row-inline').each(function (node) {
						if (node.one('select'))
						{
							var nameOfElement = node.one('select').get("name");
							var titleKey =  node.one('select').get("value");
							if (titleKey == "empty")
							{
								return 0;
							}
							var position = nameOfElement.substr(nameOfElement.length -1);
							if(levelQuestion == 1){
								var numberInput  = A.one('#<portlet:namespace />numberQuestionEachSubjectEasy' + position);
							}
							if(levelQuestion == 2){
								var numberInput  = A.one('#<portlet:namespace />numberQuestionEachSubjectNormal' + position);
							}
							if(levelQuestion == 3){
								var numberInput  = A.one('#<portlet:namespace />numberQuestionEachSubjectHigh' + position);
							}
							if(levelQuestion == 4){
								var numberInput  = A.one('#<portlet:namespace />numberQuestionEachSubjectVeryHigh' + position);
							}
							for( i in numberOfQuestionJSON )
							{
								if (numberOfQuestionJSON[i].subjectID == titleKey && numberOfQuestionJSON[i].levelQuestion == levelQuestion.toString() )
								{
									if(parseInt(numberInput.get("value")) > parseInt(numberOfQuestionJSON[i].totalQuestion)){
										var message = "<liferay-ui:message key='exam-alert-message-number-question'/>";
										alert(message);
										numberInput.set('value', "0");
									}
								}
							}
							
						}
					});
				});
	}
	function validateNumberQuestion()
	{
		var validNumberQuestion = true;
		var configNumberQuestion = "<%= configNumberQuestion %>";
		AUI().use('liferay-auto-fields',
				function(A) 
				{
					var numberOfQuestion = 0;
					var point = 100;
					A.one('#specialSubject-fields').all('.lfr-form-row-inline').each(function (node) {
						
						node.all('.input-text-wrapper').each(function (node2){
							if (node2.one('input'))
							{
								var inputValue = node2.one('input').get("value");
								if(inputValue == ""){
									inputValue = 0;
								}
								numberOfQuestion = numberOfQuestion + parseInt(inputValue);
								console.log(node2.one('input').get("name") + ":" + node2.one('input').get("value"));
							}
						});
						
					});
					var isWrong = point % numberOfQuestion;
					console.log("numberOfQuestion:" +numberOfQuestion +  "|point:" + point);
					if (isWrong > 0)
					{
						validNumberQuestion = false;
						var message = "<liferay-ui:message key='exam-alert-message-number-question-invalid'/>";
						alert(message);
					}
					if(numberOfQuestion != configNumberQuestion){
						validNumberQuestion = false;
						var message = "<liferay-ui:message key='exam-alert-message-number-question-equal-invalid'/>";
						message = message + " <liferay-ui:message key='config-number-question'/> " + configNumberQuestion + ".";
						message = message + " <liferay-ui:message key='current-number-question'/> " + numberOfQuestion + ".";
						alert(message);
					}
				});
		return validNumberQuestion;
	}
	AUI().use('aui-datepicker',function(A)
			{
				new A.DatePicker(
					{
						trigger: '#<portlet:namespace/>startDatepicker',
						mask: '%d/%m/%Y',
						popover: {zIndex:1}
					}
				);
			}
	);
	AUI().use('aui-datepicker',function(A)
			{
				new A.DatePicker(
					{
						trigger: '#<portlet:namespace/>endDatepicker',
						mask: '%d/%m/%Y',
						popover: {zIndex:1}
					}
				);
			}
	);
	AUI().use('aui-timepicker',function(A)
			{
				new A.TimePicker(
					{
						trigger: '#<portlet:namespace/>startTimepicker',
						mask: '%H:%M',
						popover: {zIndex:1}
					}
				);		
			}
	);
	AUI().use('aui-timepicker',function(A)
			{
				new A.TimePicker(
					{
						trigger: '#<portlet:namespace/>endTimepicker',
						mask: '%H:%M',
						popover: {zIndex:1}
					}
				);		
			}
	);
	</aui:script>
</c:if>
