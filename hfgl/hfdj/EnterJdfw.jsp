<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�طö���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sjkgrq=null;
String djbh=null;
String hfdjbz=null;
String hfdjbzmc=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	ls_sql="select khxm,fwdz,sjs,zjxm,sgdmc,sjkgrq,djbh,DECODE(hfdjbz,0,'δ����',1,'���̻طö���',2,'Ͷ�߱��޻طö���',3,'ȫ������') hfdjbzmc, hfdjbz,djyy,djsj,djr,jhjdsj";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjxm=rs.getString("zjxm");
		sgd=cf.fillNull(rs.getString("sgdmc"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		hfdjbzmc=cf.fillNull(rs.getString("hfdjbzmc"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
	
	}
	rs.close();
	ps.close();
	

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
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="65" colspan="4"> 
        <div align="center">�ͻ��طýⶳ�������ţ�<%=djbh%>��</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">�ͻ����</font></td>
      <td width="28%"> 
        <input type="text" name="khbh" size="20" maxlength="20" value="<%=khbh%>" readonly>
        <input type="hidden" name="djbh" value="<%=djbh%>" >
      </td>
      <td width="17%" align="right"><font color="#0000CC">�ͻ�����</font></td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="20" value="<%=khxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="22%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> 
        <input type="text" name="khbh2" size="68" maxlength="100" value="<%=fwdz%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">���ʦ</font></td>
      <td width="28%"> 
        <input type="text" name="sjs" size="20" maxlength="20" value="<%=sjs%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">�ʼ�����</font></td>
      <td width="33%"> 
        <input type="text" name="zjxm" size="20" maxlength="20" value="<%=zjxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">ʩ����</font></td>
      <td width="28%"> 
        <input type="text" name="sgd" size="20" maxlength="20" value="<%=sgd%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
      <td width="33%"> 
        <input type="text" name="sjkgrq" size="20" maxlength="20" value="<%=sjkgrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">���᷶Χ</td>
      <td width="28%"><%=hfdjbzmc%></td>
      <td width="17%" align="right">������</td>
      <td width="33%"><%=djr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"> ����ʱ��</td>
      <td width="28%"> <%=djsj%> </td>
      <td width="17%" align="right">�ƻ��ⶳʱ��</td>
      <td width="33%"> <%=jhjdsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">����ԭ��</td>
      <td colspan="3"> <%=djyy%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right" width="22%">ʵ�ʽⶳʱ��</td>
      <td width="28%"> 
        <input type="text" name="sjjdsj" size="20" maxlength="10" value="<%=cf.today()%>">
      </td>
      <td width="17%" align="right">�ⶳ��</td>
      <td width="33%"> 
        <input type="text" name="jdr" size="20" maxlength="20" value="<%=yhdlm%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">�Ƿ��蹤�̻ط�</td>
      <td width="28%"> 
        <input type="radio" name="sfxhf"  value="Y">
        ��ط� 
        <input type="radio" name="sfxhf"  value="N" onClick="f1(selectform)">
        ����ط� </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">���̻ط�����</td>
      <td width="28%"> 
        <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right">���̻ط�����</td>
      <td width="33%"> 
        <input type="text" name="hfrq" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="���̻طýⶳ" onClick="f_gcdo(selectform)" <% if (hfdjbz.equals("0") || hfdjbz.equals("2")) out.println("disabled"); %>>
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">Ͷ�߱����Ƿ���ط�</td>
      <td width="28%"> 
        <input type="radio" name="tssfxhf"  value="Y">
        ��ط� 
        <input type="radio" name="tssfxhf"  value="N" onClick="f2(selectform)">
        ����ط� </td>
      <td width="17%" align="right">Ͷ�߱��޻ط�����</td>
      <td width="33%"> 
        <input type="text" name="hfsj"  size="20" maxlength="10" >
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="Ͷ�߱��޻طýⶳ" onClick="f_tsdo(selectform)" <% if (hfdjbz.equals("0") || hfdjbz.equals("1")) out.println("disabled"); %>>
        </div>
      </td>
    </tr>
  </table>
</form>

<P><center>Ͷ�߱��޼�¼</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">�������</td>
	<td  width="5%">����ʽ</td>
	<td  width="8%">����</td>
	<td  width="14%">С��</td>
	<td  width="24%">Ͷ�߱�������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="10%">������</td>
	<td  width="7%">��ط�ʱ��</td>
	<td  width="7%">����״̬</td>
	<td  width="7%">�����־</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT distinct crm_tsjl.tsjlh as tsjlh,dm_slfsbm.slfsmc,dm_tslxbm.tslxmc,dm_tsyybm.tsyymc,crm_tsjl.tsnr,crm_tsjl.slsj,dwmc,crm_tsjl.hfsj,DECODE(crm_tsjl.clzt,0,'�ǿͷ��Ǽ�',1,'�ͷ�����',2,'�ڴ���',3,'�᰸') as clzt,DECODE(hfdjbz,'Y','�طö���','N','δ����') ";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_slfsbm,dm_tslxbm,dm_tsyybm,sq_dwxx  ";
    ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tslxbm=dm_tslxbm.tslxbm ";
    ls_sql+=" and crm_tsjl.slbm=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"' and crm_tsjl.hfdjbz='Y' and crm_tsjl.clzt!='3'";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh ";
    ls_sql+=" order by crm_tsjl.slsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","JdCrm_tsjl.jsp");
	pageObj.setEditStr("���ûط�ʱ��");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f1(FormName)//����FormName:Form������
{
	if (FormName.sfxhf[0].checked)
	{
	}
	else{
		FormName.hfrq.value='';
		FormName.hflxbm.value='';
	}
}
function f_gcdo(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjjdsj)=="") {
		alert("��ѡ��[ʵ�ʽⶳʱ��]��");
		FormName.sjjdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjdsj, "ʵ�ʽⶳʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jdr)=="") {
		alert("��ѡ��[�ⶳ��]��");
		FormName.jdr.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}

	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hflxbm)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hflxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.hfrq)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfrq, "�ط�����"))) {
			return false;
		}
	}

	FormName.action="SaveGchfJd.jsp";
	FormName.submit();
	return true;
}

function f2(FormName)//����FormName:Form������
{
	if (FormName.tssfxhf[0].checked)
	{
	}
	else{
		FormName.hfsj.value='';
	}
}
function f_tsdo(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjjdsj)=="") {
		alert("��ѡ��[ʵ�ʽⶳʱ��]��");
		FormName.sjjdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjdsj, "ʵ�ʽⶳʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jdr)=="") {
		alert("��ѡ��[�ⶳ��]��");
		FormName.jdr.focus();
		return false;
	}
	if(	!radioChecked(FormName.tssfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.tssfxhf[0].focus();
		return false;
	}

	if (FormName.tssfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfsj)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfsj, "�ط�����"))) {
			return false;
		}
	}

	FormName.action="SaveTsBxhfJd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
