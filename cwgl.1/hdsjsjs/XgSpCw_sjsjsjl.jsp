<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String cw_sjsjsjl_jsjlh=null;
String cw_sjsjsjl_fgsbh=null;
String cw_sjsjsjl_dwbh=null;
String cw_sjsjsjl_sjsbh=null;
String cw_sjsjsjl_sjfw2=null;
String cw_sjsjsjl_dyqdze=null;
String cw_sjsjsjl_dyqds=null;
String cw_sjsjsjl_sjstcbl=null;
String cw_sjsjsjl_sjsjsbl=null;
String cw_sjsjsjl_dyjss=null;
String cw_sjsjsjl_jzssk=null;
String cw_sjsjsjl_wgjsje=null;
String cw_sjsjsjl_kqtk=null;
String cw_sjsjsjl_qdsyjsje=null;
String cw_sjsjsjl_sjf=null;
String cw_sjsjsjl_sjfksbl=null;
String cw_sjsjsjl_sjftcbl=null;
String cw_sjsjsjl_dyjsze=null;
String cw_sjsjsjl_lrr=null;
String cw_sjsjsjl_lrsj=null;
String sq_dwxx_dwmc=null;
String spbz=null;
String spyj=null;
String cw_sjsjsjl_spr=null;
String cw_sjsjsjl_spsj=null;
String cw_sjsjsjl_bz=null;
String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_sjsjsjl.jsjlh as cw_sjsjsjl_jsjlh,cw_sjsjsjl.fgsbh as cw_sjsjsjl_fgsbh,cw_sjsjsjl.dwbh as cw_sjsjsjl_dwbh,cw_sjsjsjl.sjsbh as cw_sjsjsjl_sjsbh,cw_sjsjsjl.sjfw2 as cw_sjsjsjl_sjfw2,cw_sjsjsjl.dyqdze as cw_sjsjsjl_dyqdze,cw_sjsjsjl.dyqds as cw_sjsjsjl_dyqds,cw_sjsjsjl.sjstcbl as cw_sjsjsjl_sjstcbl,cw_sjsjsjl.sjsjsbl as cw_sjsjsjl_sjsjsbl,cw_sjsjsjl.dyjss as cw_sjsjsjl_dyjss,cw_sjsjsjl.jzssk as cw_sjsjsjl_jzssk,cw_sjsjsjl.wgjsje as cw_sjsjsjl_wgjsje,cw_sjsjsjl.kqtk as cw_sjsjsjl_kqtk,cw_sjsjsjl.qdsyjsje as cw_sjsjsjl_qdsyjsje,cw_sjsjsjl.sjf as cw_sjsjsjl_sjf,cw_sjsjsjl.sjfksbl as cw_sjsjsjl_sjfksbl,cw_sjsjsjl.sjftcbl as cw_sjsjsjl_sjftcbl,cw_sjsjsjl.dyjsze as cw_sjsjsjl_dyjsze,cw_sjsjsjl.lrr as cw_sjsjsjl_lrr,cw_sjsjsjl.lrsj as cw_sjsjsjl_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,cw_sjsjsjl.spbz as spbz,cw_sjsjsjl.spyj as spyj,cw_sjsjsjl.spr as cw_sjsjsjl_spr,cw_sjsjsjl.spsj as cw_sjsjsjl_spsj,cw_sjsjsjl.bz as cw_sjsjsjl_bz ";
	ls_sql+=" from  cw_sjsjsjl,sq_dwxx";
	ls_sql+=" where cw_sjsjsjl.lrbm=sq_dwxx.dwbh and  (cw_sjsjsjl.jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_sjsjsjl_jsjlh=cf.fillNull(rs.getString("cw_sjsjsjl_jsjlh"));
		cw_sjsjsjl_fgsbh=cf.fillNull(rs.getString("cw_sjsjsjl_fgsbh"));
		cw_sjsjsjl_dwbh=cf.fillNull(rs.getString("cw_sjsjsjl_dwbh"));
		cw_sjsjsjl_sjsbh=cf.fillNull(rs.getString("cw_sjsjsjl_sjsbh"));
		cw_sjsjsjl_sjfw2=cf.fillNull(rs.getDate("cw_sjsjsjl_sjfw2"));
		cw_sjsjsjl_dyqdze=cf.fillNull(rs.getString("cw_sjsjsjl_dyqdze"));
		cw_sjsjsjl_dyqds=cf.fillNull(rs.getString("cw_sjsjsjl_dyqds"));
		cw_sjsjsjl_sjstcbl=cf.fillNull(rs.getString("cw_sjsjsjl_sjstcbl"));
		cw_sjsjsjl_sjsjsbl=cf.fillNull(rs.getString("cw_sjsjsjl_sjsjsbl"));
		cw_sjsjsjl_dyjss=cf.fillNull(rs.getString("cw_sjsjsjl_dyjss"));
		cw_sjsjsjl_jzssk=cf.fillNull(rs.getString("cw_sjsjsjl_jzssk"));
		cw_sjsjsjl_wgjsje=cf.fillNull(rs.getString("cw_sjsjsjl_wgjsje"));
		cw_sjsjsjl_kqtk=cf.fillNull(rs.getString("cw_sjsjsjl_kqtk"));
		cw_sjsjsjl_qdsyjsje=cf.fillNull(rs.getString("cw_sjsjsjl_qdsyjsje"));
		cw_sjsjsjl_sjf=cf.fillNull(rs.getString("cw_sjsjsjl_sjf"));
		cw_sjsjsjl_sjfksbl=cf.fillNull(rs.getString("cw_sjsjsjl_sjfksbl"));
		cw_sjsjsjl_sjftcbl=cf.fillNull(rs.getString("cw_sjsjsjl_sjftcbl"));
		cw_sjsjsjl_dyjsze=cf.fillNull(rs.getString("cw_sjsjsjl_dyjsze"));
		cw_sjsjsjl_lrr=cf.fillNull(rs.getString("cw_sjsjsjl_lrr"));
		cw_sjsjsjl_lrsj=cf.fillNull(rs.getDate("cw_sjsjsjl_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		spbz=cf.fillNull(rs.getString("spbz"));
		spyj=cf.fillNull(rs.getString("spyj"));
		cw_sjsjsjl_spr=cf.fillNull(rs.getString("cw_sjsjsjl_spr"));
		cw_sjsjsjl_spsj=cf.fillNull(rs.getDate("cw_sjsjsjl_spsj"));
		cw_sjsjsjl_bz=cf.fillNull(rs.getString("cw_sjsjsjl_bz"));
	}
	rs.close();
	ps.close();
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
<title>���ʦ����---���� </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><strong>���ʦ����---�޸�����</strong> </div>
<form method="post" action="SaveXgSpCw_sjsjsjl.jsp" name="editform">
<table width="101%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="15%" bgcolor="#FFFFCC"><div align="right">������</div></td>
    <td width="35%" bgcolor="#FFFFCC"><input type="text" name="spr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
    <td width="14%" bgcolor="#FFFFCC"><div align="right">����ʱ��</div></td>
    <td width="36%" bgcolor="#FFFFCC"><input type="text" name="spsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">������־</td>
    <td colspan="3" bgcolor="#FFFFCC">
<%
	cf.radioToken(out, "spbz","3+����ͨ��&4+����δͨ��",spbz);
%>
	  </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td bgcolor="#FFFFCC"><div align="right">�������</div></td>
    <td colspan="3" bgcolor="#FFFFCC"><textarea name="spyj" cols="69" rows="3"><%=spyj%></textarea>
        <div align="right"></div></td>
  </tr>
  <tr>
    <td colspan="4" height="2">&nbsp;
        <div align="center">
          <input type="hidden" name="jsjlh"  value="<%=jsjlh%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
      </div></td>
  </tr>
</table>
</form>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����¼��  </td>
  <td width="32%"> 
    <%=cw_sjsjsjl_jsjlh%>  </td>
  <td align="right" width="18%"> 
    �ֹ�˾  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sjsjsjl_fgsbh+"'",cw_sjsjsjl_fgsbh,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sjsjsjl_dwbh+"'",cw_sjsjsjl_dwbh,true);
%>  </td>
  <td align="right" width="18%"> 
    �����  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sjsjsjl_sjsbh+"'",cw_sjsjsjl_sjsbh,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ʱ�䷶Χ��  </td>
  <td width="32%"> 
    <%=cw_sjsjsjl_sjfw2%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="27" colspan="4" align="center" bgcolor="#FFFFCC">ǩ�����</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">ǩ���ܶ�</td>
  <td bgcolor="#FFFFCC"><%=cw_sjsjsjl_dyqdze%></td>
  <td align="right" bgcolor="#FFFFCC">ǩ������</td>
  <td bgcolor="#FFFFCC"><%=cw_sjsjsjl_dyqds%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC">���ʦ��ɱ���</td>
  <td width="32%" bgcolor="#FFFFCC"><%=cw_sjsjsjl_sjstcbl%>%</td>
  <td width="18%" align="right" bgcolor="#FFFFCC">���ʦ�������</td>
  <td width="32%" bgcolor="#FFFFCC"><%=cw_sjsjsjl_sjsjsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="30" colspan="4" align="center" bgcolor="#E8E8FF">�깤����</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF">��װʵ�տ�</td>
  <td width="32%" bgcolor="#E8E8FF"><%=cw_sjsjsjl_jzssk%></td>
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    �깤������  </td>
  <td width="32%" bgcolor="#E8E8FF"> 
    <%=cw_sjsjsjl_dyjss%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF">�깤������</td>
  <td width="32%" bgcolor="#E8E8FF"><%=cw_sjsjsjl_wgjsje%></td>
  <td width="18%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td width="32%" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    ǩ��ʱ�ѽ�����  </td>
  <td width="32%" bgcolor="#E8E8FF"><%=cw_sjsjsjl_qdsyjsje%></td>
  <td width="18%" align="right" bgcolor="#E8E8FF">��������</td>
  <td width="32%" bgcolor="#E8E8FF"><%=cw_sjsjsjl_kqtk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="29" colspan="4" align="center" bgcolor="#FFFFCC">��Ʒ����</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    ��Ʒ�  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=cw_sjsjsjl_sjf%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    ��Ʒѿ�˰����  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=cw_sjsjsjl_sjfksbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    ��Ʒ���ɱ���  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=cw_sjsjsjl_sjftcbl%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
  <td width="32%" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="35" align="right" bgcolor="#FFCCFF">���ʦ�����ܶ�</td>
  <td colspan="3" bgcolor="#FFCCFF"><%=cw_sjsjsjl_dyjsze%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ¼����  </td>
  <td width="32%"> 
    <%=cw_sjsjsjl_lrr%>  </td>
  <td align="right" width="18%"> 
    ¼��ʱ��  </td>
  <td width="32%"> 
    <%=cw_sjsjsjl_lrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ¼�벿��  </td>
  <td width="32%"> 
    <%=sq_dwxx_dwmc%>  </td>
  <td align="right" width="18%"> 
    ������־  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"2+δ����&3+����ͨ��&4+����δͨ��",spbz,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ʱ��</td>
  <td width="32%"><%=cw_sjsjsjl_spsj%></td>
  <td align="right" width="18%"> 
    ������  </td>
  <td width="32%"> 
    <%=cw_sjsjsjl_spr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td colspan="3"><%=spyj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע </td>
  <td colspan="3"><%=cw_sjsjsjl_bz%></td>
  </tr>
</table>
<center>ǩ����ϸ</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<td  width="7%">��ͬ��</td>
<td  width="5%">����</td>
<td  width="20%">���ݵ�ַ</td>
<td  width="5%">���ʦ</td>
<td  width="5%">ʩ����</td>
<td  width="5%">�ʼ�</td>
<td  width="9%">ǩԼ����</td>
<td  width="7%">ǩԼ����</td>
<td  width="7%">����ǩԼ��</td>
<td  width="7%">��װʵ���� </td>
<td  width="4%">��ɱ���</td>
<td  width="7%">�ѽ�����</td>
<td  width="6%">���̽���</td>
<td  width="6%">���ʦ����</td>
</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.qye,crm_khxx.sfke,crm_khxx.sjstcbl||'%',qdsyjsje,ysgcjdmc,DECODE(sjsjsbz,'0','δ����','1','ǩ������','2','�깤����')  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and crm_khxx.sjsjsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sjsbh='"+cw_sjsjsjl_sjsbh+"'";
    ls_sql+=" order by qyrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%> 
</table>

<center>������ϸ</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<td  width="7%">��ͬ��</td>
<td  width="5%">����</td>
<td  width="19%">���ݵ�ַ</td>
<td  width="5%">���ʦ</td>
<td  width="5%">ʩ����</td>
<td  width="5%">�ʼ�</td>
<td  width="9%">ǩԼ����</td>
<td  width="7%">ǩԼ����</td>
<td  width="7%">����ǩԼ��</td>
<td  width="7%">��װʵ�տ�</td>
<td  width="5%">��ɱ���</td>
<td  width="7%">�ѽ�����</td>
<td  width="6%">ʩ���ӽ���</td>
<td  width="6%">���ʦ����</td>
</tr>
	<%

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.qye,crm_khxx.sfke,crm_khxx.sjstcbl||'%',qdsyjsje,DECODE(gdjsjd,'0','δ����','1','�ѽ���'),DECODE(sjsjsbz,'0','δ����','1','ǩ������','2','�깤����')  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_gdjsjl";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and crm_khxx.gdjsjlh=cw_gdjsjl.gdjsjlh ";
	ls_sql+=" and crm_khxx.wgjsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sjsbh='"+cw_sjsjsjl_sjsbh+"'";
    ls_sql+=" order by qyrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%> 
</table>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.spbz)) {
		alert("��ѡ��[������־]��");
		FormName.spbz[0].focus();
		return false;
	}
	
	if(	javaTrim(FormName.spr)=="") {
		alert("��¼��������");
		FormName.spsj.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("������[����ʱ��]��");
		FormName.spsj.focus();
		return false;
	}
  if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
