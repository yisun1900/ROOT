<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");
String bjjbbm=null;
String dqbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;

String save=cf.fillNull(request.getParameter("save"));

String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String xmlrr=cf.GB2Uni(request.getParameter("lrr"));

if (save!=null && save.equals("Y"))
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���ӳɹ���");
	//-->
	</SCRIPT>
	<%
}
else if (save.equals("D"))
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT bj_zdyxmb.dqbm,bjjbbm,xmmc,dqmc,xmdlmc,xmxlmc,clcb,rgcb,jxcb,cbenj";
	ls_sql+=" FROM bj_zdyxmb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_zdyxmb.lrr='"+xmlrr+"' and bj_zdyxmb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_zdyxmb.dqbm=dm_dqbm.dqbm and bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		bjjbbm=rs.getString("bjjbbm");
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		jxcb=rs.getDouble("jxcb");
		cbenj=rs.getDouble("cbenj");
	}
	else{
		out.println("������Ŀ������");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>�Զ�����Ŀ���Ϸ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
.STYLE6 {color: #990000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" >
  <div align="center">�Զ�����Ŀ���Ϸ�����</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr>
        <td align="right"><span class="STYLE1">����</span></td>
        <td><%=dqmc%></td>
        <td align="right">&nbsp;</td>
        <td></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">��Ŀ���</span></td>
        <td><%=xmbh%></td>
        <td align="right"><span class="STYLE1">���ۼ���</span></td>
        <td><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">��Ŀ����</span></td>
        <td colspan="3"><%=xmmc%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">��Ŀ����</span></td>
        <td><%=xmdlbm%></td>
        <td align="right"><span class="STYLE1">��ĿС��</span></td>
        <td><%=xmxlbm%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">���ϳɱ�</span></td>
        <td><span class="STYLE6"><%=clcb%></span></td>
        <td align="right"><span class="STYLE6">�˹��ɱ�</span></td>
        <td><span class="STYLE6"><%=rgcb%></span></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">�ɱ���</span></td>
        <td><span class="STYLE6"><%=cbenj%>          <br>
        </span></td>
        <td align="right"><span class="STYLE6">��е�ɱ�</span></td>
        <td><span class="STYLE6"><%=jxcb%></span></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="24" colspan="4" align="center" bgcolor="#FFFFCC"><strong>�������Ӳ��ϣ���</strong></td>
      </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>���Ϸ���</td>
      <td width="32%"><select name="glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm where glflbm='1' order by glflbm","");
%>
      </select></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>��������</td>
      <td colspan="3"><input type="text" name="glfxclmc" value="" size="73" maxlength="100"  onKeyUp="changheIn(insertform)" >       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span><span class="STYLE1">���ϱ���</span></td>
      <td><input type="text" name="glfxclbm" value="" size="20" maxlength="100"  readonly></td>
      <td align="right"><span class="STYLE2">*</span><span class="STYLE1">������λ</span></td>
      <td><input type="text" name="jldwbm" value="" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">
		<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
		</select>&nbsp;</td>
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">����</span></td>
      <td width="32%"><input type="text" name="dj" value="" size="20" maxlength="17" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>������</td>
      <td width="32%"><input type="text" name="xhl" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span>��ȩ�ͷ���</td>
      <td width="32%"><input type="text" name="jqsfl" value="0" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>���ͷ���</td>
      <td width="32%"><input type="text" name="bsfl" value="0" size="20" maxlength="17" >      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span>TVOC�ͷ���</td>
      <td width="32%"><input type="text" name="tvocsfl" value="0" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>����</td>
      <td width="32%"><input name="lx" type="radio"  value="1" checked>
        ��ӡ
        <input type="radio" name="lx"  value="2">
        ����ӡ </td>
      <td align="right" width="18%"><span class="STYLE2">*</span>�Ƿ���Ҫ��������</td>
      <td width="32%"><input name="wlllbz" type="radio"  value="Y" checked>
        ��Ҫ
        <input type="radio" name="wlllbz"  value="N">
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">¼����</span></td>
      <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">¼��ʱ��</span></td>
      <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">��ע</td>
      <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>      </td>
    </tr>
    <tr align="center">
      <td colspan="4"><input type="button"  value="���Ӳ���" onClick="f_lrcl(insertform)" >
        <input type="button"  value="�����˹�" onClick="f_lrrg(insertform)" >
        <input type="button"  value="���ӻ�е" onClick="f_lrjx(insertform)" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="hidden" name="xmlrr"  value="<%=xmlrr%>" >
 </td>
    </tr>
  </table>




  <table border="1" cellspacing="0" cellpadding="1" width="160%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">&nbsp;</td>
      <td width="2%">���</td>
      <td width="3%">���Ϸ���</td>
      <td width="5%">���ϱ���</td>
      <td width="8%">��������</td>
      <td width="7%">Ʒ��</td>
      <td width="6%">�ͺ�</td>
      <td width="8%">���</td>
      <td width="3%">������λ</td>
      <td width="4%">����</td>
      <td width="4%">������</td>
      <td width="5%">���</td>
	  <td width="3%">����������</td>
	  <td width="3%">����</td>
      <td width="4%">��ȩ�ͷ���</td>
      <td width="4%">���ͷ���</td>
      <td width="4%">TVOC�ͷ���</td>
      <td width="24%" align="left">��ע</td>
    </tr>
    <%
	String bgcolor=null;
	String glbxh=null;
	String glflbm=null;
	String glfxclmc=null;
	String pp=null;
	String xh=null;
	String gg=null;
	String xl=null;
	String jldwbm=null;
	String bjjb=null;
	String glfxclbm="";
	double xhl=0;
	double dj=0;
	double je=0;
	double xjje=0;
	String lx=null;
	String wlllbz="";
	String bz=null;
	double jqsfl=0;
	double bsfl=0;
	double tvocsfl=0;

	int row=0;
	ls_sql="select glbxh,bj_zdyglfxb.glfxclbm,bj_zdyglfxb.glfxclmc,glflmc,dj,bj_zdyglfxb.jldwbm,xhl,jqsfl,bsfl,tvocsfl,DECODE(lx,'1','��ӡ','2','����ӡ') lx,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,bj_zdyglfxb.bz ";
	ls_sql+=" ,ppmc,xh,gg ";
	ls_sql+=" FROM bj_zdyglfxb,bdm_glflbm,jxc_clbm ";
	ls_sql+=" where bj_zdyglfxb.xmlrr='"+xmlrr+"' and bj_zdyglfxb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_zdyglfxb.glflbm=bdm_glflbm.glflbm(+) ";
	ls_sql+=" and trim(bj_zdyglfxb.glfxclbm)=jxc_clbm.nbbm(+)  ";
	ls_sql+=" order by bj_zdyglfxb.glflbm,glbxh";
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		glbxh=rs.getString("glbxh");

		glfxclmc=rs.getString("glfxclmc");
		glfxclbm=cf.fillHtml(rs.getString("glfxclbm"));
		glflbm=rs.getString("glflmc");
		pp=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		dj=rs.getDouble("dj");
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		jqsfl=rs.getDouble("jqsfl");
		bsfl=rs.getDouble("bsfl");
		tvocsfl=rs.getDouble("tvocsfl");
		lx=cf.fillNull(rs.getString("lx"));
		wlllbz=cf.fillHtml(rs.getString("wlllbz"));
		bz=cf.fillHtml(rs.getString("bz"));

		je=cf.round(dj*xhl,2);
		xjje+=je;

		xjje=cf.round(xjje,2);


		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td> 
        <input type="button" onClick="f_del(insertform,<%=glbxh%>)"  value="ɾ��" ></td>
      <td><%=(row+1)%> </td>
      <td><%=glflbm%>      </td>
      <td> <%=glfxclbm%>      </td>
      <td> <%=glfxclmc%>      </td>
      <td><%=pp%></td>
      <td><%=xh%></td>
      <td><%=gg%></td>
      <td><%=jldwbm%></td>
      <td> <%=dj%>      </td>
      <td> <%=xhl%>      </td>
      <td><%=je%></td>
		<td><%=wlllbz%>		</td>
		<td><%=lx%>		</td>
      <td> <%=jqsfl%>      </td>
      <td> <%=bsfl%>      </td>
      <td> <%=tvocsfl%>      </td>
      <td> <%=bz%>      </td>
    </tr>
    <%
		row++;
	}
	rs.close();
	ps.close();

%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td colspan="3">С��</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=xjje%></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%
	cf.ajax(out);//����AJAX
%>

var lx;
//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}


//�ı�����ֵ
function changheIn(FormName)
{   
	if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//�ϼ�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.glfxclmc.value;

		var valueStr=FormName.valuelist.options[FormName.valuelist.length-1].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.glfxclmc.value;

		var valueStr=FormName.valuelist.options[0].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;
	}
	else{//������
		if(javaTrim(FormName.glfxclmc)=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

//		alert("ddd");

		//��ȡ�ͺ��б�
		var actionStr="GetListByAjaxZdy.jsp?dqbm=<%=dqbm%>&xmlrr=<%=xmlrr%>&xmbh=<%=xmbh%>&invalue="+FormName.glfxclmc.value;

//		window.open(actionStr);
		lx="1";
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		//ȥ��ǰ��Ļ��з�
		while (true)
		{
			if (ajaxRetStr.substring(0,1)=="\r")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else if (ajaxRetStr.substring(0,1)=="\n")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else{
				break;
			}
		}

		//����������
		insertform.valuelist.length=0;

		if (ajaxRetStr!="")
		{
			insertform.valuelist.style.display='block';
			strToItem3(insertform.valuelist,ajaxRetStr);
		}
		else{
			insertform.valuelist.style.display='none';
		}
	}

}

//�ı���������Ŀ
function changeItem(FormName,field)
{
	if(event.keyCode==38)//�ϼ�ͷ
	{
		if (mark=="last")
		{
			mark="";
		}

		var valueStr=field.options[field.selectedIndex].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext;

				FormName.glfxclmc.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		if (mark=="first")
		{
			mark="";
		}

		var valueStr=field.options[field.selectedIndex].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext
				FormName.glfxclmc.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
		FormName.glfxclmc.focus();
	}
}

//˫����������Ŀ
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	var valueStr=field.options[field.selectedIndex].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

	FormName.glfxclmc.focus();
}


function f_lrcl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ������]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.glflbm)=="") {
		alert("��ѡ��[���Ϸ���]��");
		FormName.glflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("������[��������]��");
		FormName.glfxclmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("������[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.xhl)=="") {
		alert("������[������]��");
		FormName.xhl.focus();
		return false;
	}
	if(!(isFloat(FormName.xhl, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jqsfl)=="") {
		alert("������[��ȩ�ͷ���]��");
		FormName.jqsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.jqsfl, "��ȩ�ͷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bsfl)=="") {
		alert("������[���ͷ���]��");
		FormName.bsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.bsfl, "���ͷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tvocsfl)=="") {
		alert("������[TVOC�ͷ���]��");
		FormName.tvocsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.tvocsfl, "TVOC�ͷ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
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

	FormName.action="SaveInsertBj_zdyglfxb.jsp";
	FormName.submit();
	return true;
}


function f_lrrg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmlrr)=="") {
		alert("������[��Ŀ¼����]��");
		FormName.xmlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="InsertBj_zdyglfxbRgf.jsp";
	FormName.submit();
	return true;
}


function f_lrjx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmlrr)=="") {
		alert("������[��Ŀ¼����]��");
		FormName.xmlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="InsertBj_zdyglfxbJxf.jsp";
	FormName.submit();
	return true;
}

function f_del(FormName,glbxh)//����FormName:Form������
{
	if ( confirm("ȷʵҪ������?") )	
	{

		FormName.action="DeleteBj_zdyglfxb.jsp?glbxh="+glbxh;
		FormName.submit();
		return true;
	}
} 
//-->
</SCRIPT>
