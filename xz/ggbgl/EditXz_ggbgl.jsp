<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String ggmc=null;
String ggnr=null;
String fbsj=null;
String fbr=null;
String fbbm=null;
String fbfgs=null;
String lrr=null;
String lrsj=null;
String ggfw=null;
String ggfgs=null;
String ggbm=null;
String ggyhz=null;
String ggbh=cf.GB2Uni(request.getParameter("ggbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
oracle.sql.CLOB   clob=null;   
String   s=null;
try {
	conn=cf.getConnection();
	ls_sql="select ggmc,ggnr,fbsj,fbr,fbbm,fbfgs,lrr,lrsj,ggfw ";
	ls_sql+=" from  xz_ggbgl";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ggmc=cf.fillNull(rs.getString("ggmc"));
		ggnr=cf.fillNull(rs.getString("ggnr"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		fbr=cf.fillNull(rs.getString("fbr"));
		fbbm=cf.fillNull(rs.getString("fbbm"));
		fbfgs=cf.fillNull(rs.getString("fbfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		ggfw=cf.fillNull(rs.getString("ggfw"));

		clob = (oracle.sql.CLOB)rs.getClob("ggnr");   
		if(clob!=null)
		{
			Reader is=clob.getCharacterStream();   
			BufferedReader br=new BufferedReader(is);   
			s=br.readLine();   
			while(s!=null)
			{   
				ggnr+=s;   
				s=br.readLine();   
			}   
		}   
	}
	rs.close();
	ps.close();

	if(ggfw.equals("3"))//1：公告集团所有员工；2：公告分公司；3：公告部门；4：公告用户组；5：公告具体员工
	{
		ls_sql="select distinct ggfgs from xz_ggbm where ggbh='"+ggbh+"'";	
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ggfgs=cf.fillNull(rs.getString("ggfgs"));
		}
		rs.close();
		ps.close();
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"><b>请修改公告信息（公告编号：<%=ggbh%>）</b></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">标题</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="ggmc" size="72" maxlength="100"  value="<%=ggmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">发布人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbr" size="20" maxlength="20"  value="<%=fbr%>" >
              </td>
              <td width="15%"> 
                <div align="right">发布时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbsj" size="20" maxlength="10"  value="<%=fbsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right"><font color="#0000FF">录入人</font></div>
              </td>
              <td> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td> 
                <div align="right"><font color="#0000FF">录入时间</font></div>
              </td>
              <td> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">发布部门</font></td>
              <td> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fbbm+"'",fbbm);
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">发布分公司</font></td>
              <td> 
                <select name="fbfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fbfgs+"'","");
%> 
                </select>
              </td>
            </tr>
			<tr bgcolor="#FFFFFF">
			 <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>公告内容 </div>
                <div align="right"></div>
              </td>
              <td colspan=3> 
			<div id="editor_body"></div>
			<input type="hidden" value="" name="ggnr">
			</td>
			</tr>
			
			
            <tr> 
              <td colspan="4" align="center"><b><font color="#FF0000">选择公告对象（注意：只有被选择的用户才能收到公告）</font></b></td>
            </tr>
            <tr  bgcolor="#FFFFFF"> 
              <td colspan="4" align="center">
				  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#FFFFFF">
                    <td width="29%"><b>公告范围：</b> <BR>
					<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
%> 
					  <input type="radio" name="ggfw" value="1" onClick="radioGgjt(insertform)" <% if (ggfw.equals("1")) out.println("checked"); %>>
                      公告集团所有员工 <%
	}
%> <BR>
					  <input type="radio" name="ggfw" value="2"  onClick="radioGggs(insertform)" <% if (ggfw.equals("2")) out.println("checked"); %>>
                      公告分公司 <BR>
					  <input type="radio" name="ggfw" value="3" onClick="radioXzbm(insertform);"  <% if (ggfw.equals("3")) out.println("checked"); %>>
                      公告部门 <BR>
					  <input type="radio" name="ggfw" value="4"  onClick="radioGgyhz(insertform)" <% if (ggfw.equals("4")) out.println("checked"); %>>
                      公告用户组 <BR>
                      <input type="radio" name="ggfw" value="5" onClick="radioXzyh(insertform);" <% if (ggfw.equals("5")) out.println("checked"); %>>
                      公告具体员工 </td>
                    <td width="71%" align="left"> 

					<%
					if (ggfw.equals("2"))
					{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0101" style="display:block">
						<%
					}
					else{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0101" style="display:none">
						<%
					}
					%>
							<tr>
								<td width="10%" align="right" valign="middle">分公司</td> 
								<td width="90%" valign="left">
								  <select name="ggfgs" style="FONT-SIZE:12PX;WIDTH:150PX" multiple size="12" >
									<%
									if (ggfw.equals("2"))
									{
										if (yhjs.equals("A0") || yhjs.equals("A1"))
										{
											out.println("<option value=\"\"></option>");
											cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","select ggfgs from xz_ggfgs where ggbh='"+ggbh+"'");
										}
										else{
											cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","select ggfgs from xz_ggfgs where ggbh='"+ggbh+"'");
										}
									}
									else{
										if (yhjs.equals("A0") || yhjs.equals("A1"))
										{
											out.println("<option value=\"\"></option>");
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
										}
										else{
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
										}
									}
									%> 
								  </select>
								</td>
							</tr>
						</table>

					
					<%
					if (ggfw.equals("3"))
					{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12" id="id0102" style="display:block">
						<%
					}
					else{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12" id="id0102" style="display:none">
						<%
					}
					%>
							<tr>
								<td width="8%" align="right" valign="top">分公司</td>
								<td width="27%" align="left" valign="top"> 
								  <select name="bmfgs" style="FONT-SIZE:12PX;WIDTH:130PX" onChange="changegs(insertform);"  >
									<%
									if (ggfw.equals("3"))
									{
										if (yhjs.equals("A0") || yhjs.equals("A1"))
										{
											out.println("<option value=\"\"></option>");
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh",ggfgs);
										}
										else{
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'",ggfgs);
										}
									}
									else{
										if (yhjs.equals("A0") || yhjs.equals("A1"))
										{
											out.println("<option value=\"\"></option>");
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
										}
										else{
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
										}
									}
									%> 
								 </select>
							   </td>
								<td width="8%" align="right" valign="middle">部门</td>
								<td width="37%">
								  <select name="ggbm" style="FONT-SIZE:12PX;WIDTH:150PX" multiple size="12">
									<%
									if (ggfw.equals("3"))
									{
										out.println("<option value=\"\"></option>");
										cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ggfgs+"' order by dwbh","select ggbm from xz_ggbm where ggbh='"+ggbh+"'");
									}
									else{
										if (yhjs.equals("A0") || yhjs.equals("A1"))
										{
											out.println("<option value=\"\"></option>");
										}
										else
										{
											out.println("<option value=\"\"></option>");
											cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
										}
									}
									%> 
								  </select>
								</td>
							</tr>
						</table>


					<%
					if (ggfw.equals("4"))
					{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0103" style="display:block">
						<%
					}
					else{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0103" style="display:none">
						<%
					}
					%>
							<tr>
								<td width="10%" align="right" valign="middle">用户组</td> 
								<td width="90%" align="left" >
								  <select name="ggyhz" style="FONT-SIZE:12PX;WIDTH:150PX" multiple size="12">
									<%
									if (ggfw.equals("4"))
									{
										out.println("<option value=\"\"></option>");
										cf.mutilSelectItem(out,"select yhzbh,yhzmc from sq_yhz order by yhzmc","select ggyhz from xz_ggyhz where ggbh='"+ggbh+"'");
									}
									else{
										out.println("<option value=\"\"></option>");
										cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz order by yhzmc","");
									}
									%> 
								  </select>
								</td>
							</tr>
						</table>



					<%
					if (ggfw.equals("5"))
					{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0104" style="display:block">
						<%
					}
					else{
						%>
						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0104" style="display:none">
						<%
					}
					%>
						  <tr> 
							<td width="33%" valign="top"> 
							  公司 
								<select name="xzfgs" style="FONT-SIZE:12PX;WIDTH:130PX" onChange="getgsyh(insertform);">
								  <%
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
										out.println("<option value=\"\"></option>");
										out.println("<OPTION  value='all'>全部公司</OPTION>");
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
									}
									else{
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
									}
								%> 
								</select>
							  <BR>部门 
								<select name="xzbm" style="FONT-SIZE:12PX;WIDTH:130PX" onChange="getbmyh(insertform)">
								  <%
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
										out.println("<option value=\"\"></option>");
							//			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
									}
									else
									{
										out.println("<option value=\"\"></option>");
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
									}
								%> 
								</select>
							  </p>
							</td>
							<td width="15%" align="right" valign="middle"> 
							  <p> 
								<input type="radio" name="sfqx" value="Y" onClick="f_xzall(insertform)">
								全选</p>
							  <p> 
								<input type="radio" name="sfqx" value="N" onClick="f_notall(insertform)">
								重选</p>
							</td>
							<td width="52%" valign="top"> 
							  <select name="yhdlm" size="12" style="FONT-SIZE:12PX;WIDTH:213PX" multiple>
								<%
								if (ggfw.equals("5"))
								{
									cf.mutilSelectItem(out,"select trim(xz_ggdx.yhdlm),'（'||dwmc||'）'||yhmc from  xz_ggdx,sq_dwxx where xz_ggdx.dwbh=sq_dwxx.dwbh and xz_ggdx.ggbh='"+ggbh+"' order by xz_ggdx.ssfgs,xz_ggdx.dwbh,yhmc","select xz_ggdx.yhdlm from  xz_ggdx where xz_ggdx.ggbh='"+ggbh+"'");
								}
								else{
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
									}
									else
									{
										cf.selectItem(out,"select yhdlm,'（'||dwmc||'）'||yhmc from  sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sq_yhxx.ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc","");
									}
								}
								%> 
							  
							  </select>
							</td>
						  </tr>
						</table>



					</td>
                  </tr>
                </table>
              </td>
            </tr>

            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <input type="hidden" name="ggbh"  value="<%=ggbh%>" >
                  <input type="button"  value="保存" onClick="f_do(insertform)">
				<input type="button" name="sc" value="上传附件" onClick="window.open('ChooseFile.jsp?ggbh=<%=ggbh%>')">
                  <input type="reset"  value="重输">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<link rel="StyleSheet" href="editor/base.css">
<script type="text/javascript" src="editor/editor.js"></script>
<script type="text/javascript">
var guid = "1324481743" ;
var sState = "iframe";
var checkEdit;

function save_article(){
	et.save();
	if(exist('editor_body_textarea')){
		setCopy($('editor_body_textarea').value);
	}else if(exist('editor_body_area')){
		setCopy($('editor_body_area').value);
	}
}
function article_preview(){
	if (check_editor()){
		var editor_win = window.open('', "_blank", '');
			editor_win.document.open('text/html', 'replace');
			editor_win.opener = null 
			editor_win.document.writeln($('editor_body_textarea').value);
			editor_win.document.close();
		}
}
function check_editor(){
	var err_msg = '请先输入文章内容';
	if ($('editor_body_textarea').value.toLowerCase() =="<div>&nbsp;</div>" ||$('editor_body_textarea').value ==""){ 
		alert(err_msg);
		return false;
	}
	else if($('editor_body_textarea').value.toLowerCase() =="<p>&nbsp;</p>" ||$('editor_body_textarea').value ==""){ 
		alert(err_msg);
		return false;
	}
	else
		return true;
}
</script>
<script type="text/javascript">
// "EditerBox" 就是 textarea 的名子
var et;
//自动保存历史开关
function readCookie(name)
{
var cookieValue = "";
var search = name + "=";
if(document.cookie.length > 0)
{ 
offset = document.cookie.indexOf(search);
if (offset != -1)
{ 
 offset += search.length;
 end = document.cookie.indexOf(";", offset);
 if (end == -1) end = document.cookie.length;
 cookieValue = unescape(document.cookie.substring(offset, end))
}
}
return cookieValue;
}

function writeCookie(name, value, hours)
{
var expire = "";
if(hours != null)
{
expire = new Date((new Date()).getTime() + hours * 3600000);
expire = "; expires=" + expire.toGMTString();
}
document.cookie = name + "=" + escape(value) + expire + ";path=/";
}

function init() 
{
	writeCookie("EDiaryEditor_RSave", "true", 1);

	var ggnr="<%=ggnr.replace("\"","\'")%>";

	if(sState == "iframe"){
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true,ggnr);
		et = EDiaryEditor;
	}else{
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, ggnr);
		et = EDiaryEditor;
	}

	try{
		$('editor_body_area').onfocus = function()
		{
			checkEdit = setInterval("save_article()", 300000);
		}

		$('editor_body_area').onblur = function()
		{
			setTimeout("save_article()", 300000);
			clearInterval(checkEdit);
		}
	}
	catch(e)
	{
	}
}
    if(window.Event)
        	window.onload = init;
	else
        	setTimeout(init, 100);
</script>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

var mark="";

//查询页面使用，增加下拉框内容
function addOption(field,str1,str2,mark)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	op1.selected = mark;     
	field.add(op1);
}


function radioGgjt(FormName)
{
	mark=getRadio(FormName.ggfw);

	id0101.style.display ='none';
	id0102.style.display ='none';
	id0103.style.display ='none';
	id0104.style.display ='none';
}

function radioGggs(FormName)
{
	mark=getRadio(FormName.ggfw);

	id0101.style.display ='block';
	id0102.style.display ='none';
	id0103.style.display ='none';
	id0104.style.display ='none';
}

function radioGgyhz(FormName)
{
	mark=getRadio(FormName.ggfw);

	id0103.style.display ='block';
	id0101.style.display ='none';
	id0102.style.display ='none';
	id0104.style.display ='none';
}

//点击，公告部门所有员工
function radioXzbm(FormName)
{
	id0102.style.display ='block';
	id0101.style.display ='none';
	id0103.style.display ='none';
	id0104.style.display ='none';

	<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		%>
		if (mark=="3")
		{
			return;
		}
		else{
			mark="3";
		}
		
		insertform.ggbm.length=1;
		
		var str="EdieXz_ggbglCx.jsp?ggbh=<%=ggbh%>&ggfw="+getRadio(FormName.ggfw)+"&bmfgs="+FormName.bmfgs.value;

		parent.menu.aform.action=str;
		parent.menu.aform.submit();
		<%
	}
	%> 
}

//公告部门所有员工，改变公司
function changegs(FormName)
{
	<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		%>
		if(	!radioChecked(FormName.ggfw)) {
			alert("请选择[公告范围]！");
			FormName.ggfw[0].focus();
			return false;
		}
		if (getRadio(FormName.ggfw)!='3')
		{
			return;
		}
		
		insertform.ggbm.length=1;
		
		var str="EdieXz_ggbglCx.jsp?ggbh=<%=ggbh%>&ggfw="+getRadio(FormName.ggfw)+"&bmfgs="+FormName.bmfgs.value;

		parent.menu.aform.action=str;
		parent.menu.aform.submit();
		<%
	}
	%> 
}

//点击，公告具体员工 
function radioXzyh(FormName)
{
	id0104.style.display ='block';
	id0101.style.display ='none';
	id0102.style.display ='none';
	id0103.style.display ='none';

	<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		%>
		if (mark=="5")
		{
			return;
		}
		else{
			mark="5";
		}


		FormName.yhdlm.length=0;
		FormName.xzbm.length=1;
		


		var str="EdieXz_ggbglCx.jsp?ggbh=<%=ggbh%>&ggfw="+getRadio(FormName.ggfw)+"&xzfgs="+FormName.xzfgs.value+"&xzbm="+FormName.xzbm.value;

		parent.menu.aform.action=str;
		parent.menu.aform.submit();
		<%
	}
	%> 
}


//点击，公告具体员工 ，改变公司
function getgsyh(FormName)
{

	if (getRadio(FormName.ggfw)!='5')
	{
		return;
	}

	FormName.yhdlm.length=0;
	FormName.xzbm.length=1;
	

	var str="EdieXz_ggbglCx.jsp?ggbh=<%=ggbh%>&ggfw="+getRadio(FormName.ggfw)+"&xzfgs="+FormName.xzfgs.value+"&xzbm="+FormName.xzbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


//点击，公告具体员工 ，改变部门
function getbmyh(FormName)
{
	if (getRadio(FormName.ggfw)!='5')
	{
		return;
	}
	

	FormName.yhdlm.length=0;

	var str="EdieXz_ggbglCx.jsp?ggbh=<%=ggbh%>&ggfw="+getRadio(FormName.ggfw)+"&xzfgs="+FormName.xzfgs.value+"&xzbm="+FormName.xzbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ggmc)=="") {
		alert("请输入[标题]！");
		FormName.ggmc.focus();
		return false;
	}
	/*if(	javaTrim(FormName.ggnr)=="") {
		alert("请输入[公告内容]！");
		FormName.ggnr.focus();
		return false;
	}*/
	var err_msg = '请输入内容;如果您已经输入内容请点击[显示源代码]!';
	if ($('editor_body_textarea').value.toLowerCase() =="<div>&nbsp;</div>"){ 
		alert(err_msg);
		return false;
	}
	else if($('editor_body_textarea').value.toLowerCase() =="<p>&nbsp;</p>"){ 
		alert(err_msg);
		return false;
	}
	else
	{
//	$("editor_body_textarea").value = this._this.iframe.contentWindow.document.body.innerHTML;
	FormName.ggnr.value=$('editor_body_textarea').value.toLowerCase()
	if (FormName.ggnr.value==null || FormName.ggnr.value=="")
	{
		alert("发送邮件前必须先[预览文章]或者[显示源代码]!");
		return false;
	}
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("请输入[发布时间]！");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "发布时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("请输入[发布人]！");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbbm)=="") {
		alert("请选择[发布部门]！");
		FormName.fbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.ggfw)) {
		alert("请选择[公告范围]！");
		FormName.ggfw[0].focus();
		return false;
	}
	if (getRadio(FormName.ggfw)=="1")//1：公告集团所有员工；2：公告分公司；3：公告部门；4：公告用户组；5：公告具体员工
	{
	}
	else if (getRadio(FormName.ggfw)=="2")
	{
		if(	!selectChecked(FormName.ggfgs)) {
			alert("请输入[公告分公司]！");
			FormName.ggfgs.focus();
			return false;
		}
	}
	else if (getRadio(FormName.ggfw)=="3")
	{
		if(	!selectChecked(FormName.ggbm)) {
			alert("请输入[公告部门]！");
			FormName.ggbm.focus();
			return false;
		}
	}
	else if (getRadio(FormName.ggfw)=="4")
	{
		if(	!selectChecked(FormName.ggyhz)) {
			alert("请输入[公告用户组]！");
			FormName.ggyhz.focus();
			return false;
		}
	}
	else if (getRadio(FormName.ggfw)=="5")
	{
		if(	!selectChecked(FormName.yhdlm)) {
			alert("请选择[公告对象]！");
			FormName.yhdlm.focus();
			return false;
		}
	}


	FormName.action="SaveEditXz_ggbgl.jsp";
	FormName.submit();
	return true;
}


function f_xzall(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		FormName.yhdlm.options[i].selected = true;     
		
	}
}

function f_notall(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		FormName.yhdlm.options[i].selected = false;     
		
	}
}
//-->
</SCRIPT>
