<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String lrbm=null;
String dwmc=null;
String ggbh=null;
int count=0;
try {
	conn=cf.getConnection();

//	FileOutputStream out = new FileOutputStream("C:\\tomcat\\webapps\\ROOT\\xz\\ggbgl\\tp\\1281768003796.jpg");
	  

	ls_sql="select NVL(max(substr(ggbh,6,6)),0)";
	ls_sql+=" from  xz_ggbgl";
	ls_sql+=" where fbbm='"+dwbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ggbh=dwbh+cf.addZero(count+1,6);
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
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
	var err_msg = '����������������';
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
<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> <b>����巢���������ţ�<%=ggbh%>��</b></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>����</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="ggmc" value="" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbr" value="<%=lrr%>" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></div>
              </td>
              <td> 
                <input type="text" name="lrr"  value=<%=lrr%>  size="20" maxlength="20" readonly>
              </td>
              <td> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></div>
              </td>
              <td> 
                <input type="text" name="lrsj" value=<%=cf.today()%> size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">��������</font></td>
              <td> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�����ֹ�˾</font></td>
              <td> 
                <select name="fbfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
%> 
                </select>
              </td>
            </tr>
			<tr bgcolor="#FFFFFF">
			 <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>�������� </div>
                <div align="right"></div>
              </td>
              <td colspan=3> 
			<div id="editor_body"></div>
			<input type="hidden" value="" name="ggnr">
			</td>
			</tr>
            <tr> 
              <td colspan="4" align="center"><b><font color="#FF0000">ѡ�񹫸����ע�⣺ֻ�б�ѡ����û������յ����棩</font></b></td>
            </tr>
            <tr  bgcolor="#FFFFFF"> 
              <td colspan="4" align="center">
				  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#FFFFFF">
                    <td width="29%" valign="top"><b>���淶Χ��</b> <BR>
					<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
%> 
                      <input type="radio" name="ggfw" value="1" onClick="radioGgjt(insertform)">
                      ���漯������Ա�� <%
	}
%> <BR>
                      <input type="radio" name="ggfw" value="2"  onClick="radioGggs(insertform)">
                      ����ֹ�˾ <BR>
                      <input type="radio" name="ggfw" value="3" onClick="radioXzbm(insertform);">
                      ���沿�� <BR>
                      <input type="radio" name="ggfw" value="4"  onClick="radioGgyhz(insertform)">
                      �����û��� <BR>
                      <input type="radio" name="ggfw" value="5" onClick="radioXzyh(insertform);">
                      �������Ա�� </td>
                    <td width="71%" align="left"> 

						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0101" style="display:none">
							<tr>
								<td width="10%" align="right" valign="middle">�ֹ�˾</td> 
								<td width="90%" valign="left">
								  <select name="ggfgs" style="FONT-SIZE:12PX;WIDTH:150PX" multiple size="12" >
									<%
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
										out.println("<option value=\"\"></option>");
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
									}
									else{
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
									}
									%> 
								  </select>
								</td>
							</tr>
						</table>

					
						<table width="100%" border="0" style="FONT-SIZE:12" id="id0102" style="display:none">
							<tr>
								<td width="8%" align="right" valign="top">�ֹ�˾</td>
								<td width="27%" align="left" valign="top"> 
								  <select name="bmfgs" style="FONT-SIZE:12PX;WIDTH:130PX" onChange="changegs(insertform);"  >
									<%
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
										out.println("<option value=\"\"></option>");
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
									}
									else{
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
									}
									%> 
								 </select>
							   </td>
								<td width="8%" align="right" valign="middle">����</td>
								<td width="37%">
								  <select name="ggbm" style="FONT-SIZE:12PX;WIDTH:150PX" multiple size="12">
									<%
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
										out.println("<option value=\"\"></option>");
									}
									else
									{
										out.println("<option value=\"\"></option>");
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
									}
									%> 
								  </select>
								</td>
							</tr>
						</table>


						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0103" style="display:none">
							<tr>
								<td width="10%" align="right" valign="middle">�û���</td> 
								<td width="90%" align="left" >
								  <select name="ggyhz" style="FONT-SIZE:12PX;WIDTH:150PX" multiple size="12">
									<%
									out.println("<option value=\"\"></option>");
									cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz order by yhzmc","");
									%> 
								  </select>
								</td>
							</tr>
						</table>



						<table width="100%" border="0" style="FONT-SIZE:12"  id="id0104" style="display:none">
						  <tr> 
							<td width="33%" valign="top"> 
							  ��˾ 
								<select name="xzfgs" style="FONT-SIZE:12PX;WIDTH:130PX" onChange="getgsyh(insertform);">
								  <%
									if (yhjs.equals("A0") || yhjs.equals("A1"))
									{
										out.println("<option value=\"\"></option>");
										out.println("<OPTION  value='all'>ȫ����˾</OPTION>");
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
									}
									else{
										cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwbh='"+ssfgs+"'","");
									}
								%> 
								</select>
							  <BR>���� 
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
								ȫѡ</p>
							  <p> 
								<input type="radio" name="sfqx" value="N" onClick="f_notall(insertform)">
								��ѡ</p>
							</td>
							<td width="52%" valign="top"> 
							  <select name="yhdlm" size="12" style="FONT-SIZE:12PX;WIDTH:213PX" multiple>
								<%
								if (yhjs.equals("A0") || yhjs.equals("A1"))
								{
								}
								else
								{
									cf.selectItem(out,"select yhdlm,'��'||dwmc||'��'||yhmc from  sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sq_yhxx.ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc","");
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
 
           <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="button" name="sc" value="�ϴ�����" onClick="window.open('ChooseFile.jsp?ggbh=<%=ggbh%>')" disabled>
                <input type="reset"  value="����" name="reset">
                <input type="hidden" name="ggbh" value="<%=ggbh%>" >
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
<script type="text/javascript">
// "EditerBox" ���� textarea ������
var et;

//�Զ�������ʷ����
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
	//et = new word("editor_body", "");
	if(sState == "iframe"){
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, "<div>&nbsp;</div>");
		et = EDiaryEditor;
	}
	else{
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, "");
		et = EDiaryEditor;
	}

	try{
		$('editor_body_area').onfocus = function(){
			checkEdit = setInterval("save_article()", 300000);
		}
		$('editor_body_area').onblur = function(){
			setTimeout("save_article()", 300000);
			clearInterval(checkEdit);
		}
	}catch(e){}
}

	if(window.Event)
        	window.onload = init;
	else
        	setTimeout(init, 100);
</script>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


var mark="";

//��ѯҳ��ʹ�ã���������������
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
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

//��������沿������Ա��
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
		
		var str="InsertXz_ggbglCx.jsp?ggfw="+getRadio(FormName.ggfw)+"&bmfgs="+FormName.bmfgs.value;

		parent.menu.aform.action=str;
		parent.menu.aform.submit();
		<%
	}
	%> 
}

//���沿������Ա�����ı乫˾
function changegs(FormName)
{
	<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		%>
		if(	!radioChecked(FormName.ggfw)) {
			alert("��ѡ��[���淶Χ]��");
			FormName.ggfw[0].focus();
			return false;
		}
		if (getRadio(FormName.ggfw)!='3')
		{
			return;
		}
		
		insertform.ggbm.length=1;
		
		var str="InsertXz_ggbglCx.jsp?ggfw="+getRadio(FormName.ggfw)+"&bmfgs="+FormName.bmfgs.value;

		parent.menu.aform.action=str;
		parent.menu.aform.submit();
		<%
	}
	%> 
}

//������������Ա�� 
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
		


		var str="InsertXz_ggbglCx.jsp?ggfw="+getRadio(FormName.ggfw)+"&xzfgs="+FormName.xzfgs.value+"&xzbm="+FormName.xzbm.value;

		parent.menu.aform.action=str;
		parent.menu.aform.submit();
		<%
	}
	%> 
}


//������������Ա�� ���ı乫˾
function getgsyh(FormName)
{

	if (getRadio(FormName.ggfw)!='5')
	{
		return;
	}

	FormName.yhdlm.length=0;
	FormName.xzbm.length=1;
	

	var str="InsertXz_ggbglCx.jsp?ggfw="+getRadio(FormName.ggfw)+"&xzfgs="+FormName.xzfgs.value+"&xzbm="+FormName.xzbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


//������������Ա�� ���ı䲿��
function getbmyh(FormName)
{
	if (getRadio(FormName.ggfw)!='5')
	{
		return;
	}
	

	FormName.yhdlm.length=0;

	var str="InsertXz_ggbglCx.jsp?ggfw="+getRadio(FormName.ggfw)+"&xzfgs="+FormName.xzfgs.value+"&xzbm="+FormName.xzbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ggbh)=="") {
		alert("������[������]��");
		FormName.ggbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ggmc)=="") {
		alert("������[����]��");
		FormName.ggmc.focus();
		return false;
	}
	/*if(	javaTrim(FormName.ggnr)=="") {
		alert("������[��������]��");
		FormName.ggnr.focus();
		return false;
	}*/

	var err_msg = '����������;������Ѿ�������������[��ʾԴ����]!';
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
			alert("�����ʼ�ǰ������[Ԥ������]����[��ʾԴ����]!");
			return false;
		}
	}

	if(	javaTrim(FormName.fbsj)=="") {
		alert("������[����ʱ��]��");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("������[������]��");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.fbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.ggfw)) {
		alert("��ѡ��[���淶Χ]��");
		FormName.ggfw[0].focus();
		return false;
	}
	if (getRadio(FormName.ggfw)=="1")//1�����漯������Ա����2������ֹ�˾��3�����沿�ţ�4�������û��飻5���������Ա��
	{
	}
	else if (getRadio(FormName.ggfw)=="2")
	{
		if(	!selectChecked(FormName.ggfgs)) {
			alert("������[����ֹ�˾]��");
			FormName.ggfgs.focus();
			return false;
		}
	}
	else if (getRadio(FormName.ggfw)=="3")
	{
		if(	!selectChecked(FormName.ggbm)) {
			alert("������[���沿��]��");
			FormName.ggbm.focus();
			return false;
		}
	}
	else if (getRadio(FormName.ggfw)=="4")
	{
		if(	!selectChecked(FormName.ggyhz)) {
			alert("������[�����û���]��");
			FormName.ggyhz.focus();
			return false;
		}
	}
	else if (getRadio(FormName.ggfw)=="5")
	{
		if(	!selectChecked(FormName.yhdlm)) {
			alert("��ѡ��[�������]��");
			FormName.yhdlm.focus();
			return false;
		}
	}


	FormName.action="SaveInsertXz_ggbgl.jsp";
	FormName.submit();
	FormName.sc.disabled=false;
	FormName.bc.disabled=true;
	return true;
}

//ȫѡ
function f_xzall(FormName)//����FormName:Form������
{
	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		FormName.yhdlm.options[i].selected = true;     
		
	}
}

//��ѡ
function f_notall(FormName)//����FormName:Form������
{
	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		FormName.yhdlm.options[i].selected = false;     
		
	}
}
//-->
</SCRIPT>
