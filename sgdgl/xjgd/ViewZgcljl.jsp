<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xjjlh=null;
String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgbm=null;
double fkze=0;
double kfzs=0;
double kcjdebl=0;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
String zgcljlh=cf.GB2Uni(request.getParameter("zgcljlh"));
String jsr = null;
String jssj = null;
String jssm = null;
String zgzp = null;
String jhjjsj = null;
String zgsm = null;

String clr = null;
String clsj = null;
String clsm = null;
String clzp = null;

String ysr = null;
String yssj = null;
String ysjg = null;
String yssm = null;
String yszp = null;
String zgjlh = null;
String maxZgcljlh = null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kp_zggdmx.xjjlh,kp_zggdmx.zgzp,kp_zggdmx.jhjjsj,kp_zggdmx.zgsm,kp_zgclgdmx.jsr,kp_zgclgdmx.jssj,kp_zgclgdmx.jssm,kp_zgclgdmx.clr,kp_zgclgdmx.clsj,kp_zgclgdmx.clsm,kp_zgclgdmx.clzp,kp_zgclgdmx.ysr,kp_zgclgdmx.yssj,kp_zgclgdmx.ysjg,kp_zgclgdmx.yssm,kp_zgclgdmx.yszp,kp_zggdmx.zgjlh ";
	ls_sql+=" from  kp_zggdmx,kp_zgclgdmx ";
	ls_sql+=" where kp_zggdmx.zgjlh=kp_zgclgdmx.zgjlh and  zgcljlh='"+zgcljlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString(1));
		zgzp=cf.fillNull(rs.getString(2));
		jhjjsj=cf.fillNull(rs.getDate(3));
		zgsm=cf.fillNull(rs.getString(4));
		jsr=cf.fillNull(rs.getString(5));
		jssj=cf.fillNull(rs.getDate(6));
		jssm=cf.fillNull(rs.getString(7));
		clr=cf.fillNull(rs.getString(8));
		clsj=cf.fillNull(rs.getDate(9));
		clsm=cf.fillNull(rs.getString(10));
		clzp=cf.fillNull(rs.getString(11));
		ysr=cf.fillNull(rs.getString(12));
		yssj=cf.fillNull(rs.getDate(13));
		ysjg=cf.fillNull(rs.getString(14));
		yssm=cf.fillNull(rs.getString(15));
		yszp=cf.fillNull(rs.getString(16));
		zgjlh=cf.fillNull(rs.getString(17));
	}
	rs.close();
	ps.close();

	
	ls_sql="select xjjlh,khbh,xjr,xjsj,xjlxbm,xjjgbm,fkze,kcjdebl,kfzs,kcjdebl,lrr,lrsj,kp_xjgdjl.bz ,sgdmc";
	ls_sql+=" from  kp_xjgdjl,sq_sgd";
	ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and  (xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		xjjgbm=cf.fillNull(rs.getString("xjjgbm"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();
	
	if("".equals(ysjg)){
		ysjg="Y";
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div id="big" style="display:none; position:absolute; top:50px; left:100px;"><img src="images/<%=zgzp%>" onClick="javascript:document.getElementById('big').style.display='none';"></div>
<div id="bigCl" style="display:none; position:absolute; top:50px; left:100px;"><img src="images/<%=clzp%>" onClick="javascript:document.getElementById('bigCl').style.display='none';"></div>
<div id="bigYs" style="display:none; position:absolute; top:50px; left:100px;"><img src="images/<%=yszp%>" onClick="javascript:document.getElementById('bigYs').style.display='none';"></div>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ʩ���Ӽ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveYsKp_xjgdjl.jsp" name="editform"  enctype="multipart/form-data">
<input type="hidden" name="zgcljlh"  value="<%=zgcljlh%>" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#000099">�ͻ����</font></div>
              </td>
              <td width="35%"><%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#000099">ʵ��������</font></div>
              </td>
              <td width="35%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="35%"><%=khxm%></td>
              <td width="15%" align="right"><font color="#000099">��ϵ��ʽ</font></td>
              <td width="35%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">���ʦ</font></td>
              <td width="35%"><%=sjs%></td>
              <td width="15%" align="right"><font color="#000099">ʩ����</font></td>
              <td width="35%"><%=sgd%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">�ʼ�����</font></td>
              <td width="35%"><%=zjxm%></td>
              <td width="15%" align="right"><font color="#000099">ʩ������</font></td>
              <td width="35%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����</div>
              </td>
              <td width="35%"> <%=xjr%> </td>
              <td width="15%"> 
                <div align="right">���ʱ��</div>
              </td>
              <td width="35%"> <%=xjsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm,true);
%> </td>
              <td width="15%"> 
                <div align="right">�����</div>
              </td>
              <td width="35%"><%
	cf.selectItem(out,"select xjjgbm,xjjgmc from dm_xjjgbm order by xjjgbm",xjjgbm,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">�����ܶ�</td>
              <td><%=fkze%></td>
              <td align="right">�۷�����</td>
              <td><%=kfzs%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">�۳��ӵ���ٷֱ�</td>
              <td width="35%"><%=kcjdebl%>%</td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������Ƭ</td>
              <td ><img src="images/<%=zgzp%>" alt="" width="140px" height="50px" onClick="javascript:document.getElementById('big').style.display='block';" ></td>
              <td><div align="right">�ƻ����ʱ��</div></td>
              <td><%=jhjjsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����˵��</td>
              <td colspan="3"><%=zgsm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">¼����</div></td>
              <td><%=lrr%></td>
              <td><div align="right">¼��ʱ��</div></td>
              <td><%=lrsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">������</div></td>
              <td><%=jsr%></td>
              <td><div align="right">����ʱ��</div></td>
              <td><%=jssj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">����˵��</div></td>
              <td colspan="3"><%=jssm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������Ƭ</td>
              <td >
              <%
			  if(!"".equals(clzp)){
				%>
              <img src="images/<%=clzp%>" alt="" width="140px" height="50px"  onClick="javascript:document.getElementById('bigCl').style.display='block';">
              <%
			  }
			  %>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">������</div></td>
              <td><%=clr%></td>
              <td><div align="right">����ʱ��</div></td>
              <td><%=clsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����˵��</td>
              <td colspan="3"><%=clsm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������Ƭ</td>
              <td >
              <%
			  if(!"".equals(yszp)){
				%>
              <img src="images/<%=yszp%>" alt="" width="140px" height="50px" onClick="javascript:document.getElementById('bigYs').style.display='block';">
			  <%
			  }
			  %>
			  
			  </td>
              <td align="right">���ս��</td>
			  <td ><%
	cf.radioToken(out,"Y+�ϸ�&N+����",ysjg,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
              <%=ysr%>
              </td>
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
              <%=yssj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">����˵��</td>
              <td colspan="3"> 
                <%=yssm%>
              </td>
            </tr>
        
          </table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">��Ŀ����</td>
	<td  width="15%">�����Ŀ</td>
	<td  width="8%">Υ��ּ�</td>
	<td  width="7%">���ο۷�</td>
	<td  width="8%">���η���</td>
	<td  width="7%">�۳��ӵ���ٷֱ�</td>
	<td  width="14%">��������</td>
	<td  width="7%">Υ�´���</td>
	<td  width="21%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmmc,ydcdmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%',kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc,wzcs,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.kpjg=kp_sgdyzcdbm.yzcdbm(+) and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysr)=="") {
		alert("������[������]��");
		FormName.ysr.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("������[����ʱ��]��");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
