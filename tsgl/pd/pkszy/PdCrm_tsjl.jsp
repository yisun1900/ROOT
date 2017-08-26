<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String hfbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String slfsbm=null;
String yqjjsj=null;
String yzcdbm=null;
String slsj=null;
String slr=null;
String slbm=null;
String tsnr=null;
String lx=null;
String lxmc=null;
String clzt=null;
String zrbmclzt=null;
String jasj=null;
String wxsgd=null;
String bz=null;
String tsbxsj=null;
String lrsj=null;
String lrr=null;
String kszy=null;
String khldcs=null;
String wxfl=null;
String sfpz=null;

String bgcolor=null;
String bgcolor1=null;

int row=0;

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

try {
	conn=cf.getConnection();

	ls_sql="select tsbxsj,lrsj,lrr,tsjlh,khbh,slfsmc,slsj,slr,slbm,yqjjsj,yzcdbm,tsnr,lx,DECODE(lx,'1','Ͷ��','2','����') lxmc,clzt,zrbmclzt,jasj,wxsgd,bz";
	ls_sql+=" ,kszy,khldcs,wxfl,sfpz";
	ls_sql+=" from  crm_tsjl,dm_slfsbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tsjlh='"+tsjlh+"'";
	ls_sql+="  order by tsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kszy=cf.fillNull(rs.getString("kszy"));
		khldcs=cf.fillNull(rs.getString("khldcs"));
		wxfl=cf.fillNull(rs.getString("wxfl"));
		sfpz=cf.fillNull(rs.getString("sfpz"));

		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		clzt=cf.fillHtml(rs.getString("clzt"));
		zrbmclzt=cf.fillHtml(rs.getString("zrbmclzt"));
		jasj=cf.fillHtml(rs.getDate("jasj"));
		wxsgd=cf.fillHtml(rs.getString("wxsgd"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,dwbh,sgd,zjxm,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
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
<title>�ɿ���רԱ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePdCrm_tsjl.jsp" name="insertform" >
<div align="center"><b>�ɿ���רԱ </b></div>
<table width="100%" style="FONT-SIZE:12">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right">�ͻ����</td>
            <td width="32%"><%=khbh%></td>
            <td width="20%" align="right">��ͬ��</td>
            <td width="30%"><%=hth%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right"> 
              �ͻ�����            </td>
            <td width="32%"> <%=khxm%>��<%=lxfs%>�� </td>
            <td width="20%" align="right"> 
              ǩԼ����            </td>
            <td width="30%"><%=qyrq%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right">���ݵ�ַ</td>
            <td colspan="3"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right"> 
              ǩԼ����            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            <td width="20%" align="right"> 
              ���ʦ            </td>
            <td width="30%"><%=sjs%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right"> 
              �ʼ�            </td>
            <td width="32%"> <%=zjxm%> </td>
            <td width="20%" align="right"> 
              ʩ����&nbsp;            </td>
            <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="18%" align="right">����רԱ</td>
            <td width="32%"><%=kszy%></td>
            <td width="20%" align="right">�ͻ��������</td>
            <td width="30%"><%=khldcs%></td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="18%" align="right">ά�޷���</td>
            <td width="32%">
<%
	cf.selectToken(out,"1+����ά��&2+������ά��",wxfl,true);
%>			</td>
            <td width="20%" align="right">�Ƿ�������</td>
            <td width="30%">
<%
	cf.selectToken(out,"Y+��&N+��",sfpz,true);
%>			</td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="18%" align="right">�᰸״̬</td>
            <td width="32%">
<%
	cf.selectToken(out,"0+δ����&1+������&2+�ڴ���&3+�᰸&9+������",clzt,true);
%>			</td>
            <td width="20%" align="right">���β��Ŵ���״̬</td>
            <td width="30%"><%
	cf.selectToken(out,"1+δ����&2+�ڴ���&3+�ѽ��",zrbmclzt,true);
%></td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="18%" align="right">�᰸ʱ��</td>
            <td width="32%"><%=jasj%></td>
            <td width="20%" align="right">����</td>
            <td width="30%"><%
	cf.selectToken(out,"1+Ͷ��&2+����",lx,true);
%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF"> 
              Ͷ����Դ            </td>
            <td width="32%" bgcolor="#E8E8FF"> <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm where slfsbm='"+slfsbm+"'",slfsbm,true);
%> </td>
            <td width="20%" rowspan="9" align="right" bgcolor="#E8E8FF"> 
              Ͷ�߱�������            </td>
            <td rowspan="9" bgcolor="#E8E8FF" width="30%"><%=tsnr%> </td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">���س̶�</td>
            <td width="32%" bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">�ͻ�Ҫ����ʱ��</td>
            <td width="32%" bgcolor="#E8E8FF"><%=yqjjsj%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">�ͻ�Ͷ�߱���ʱ��</td>
            <td width="32%" bgcolor="#E8E8FF"><%=tsbxsj%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">¼����</td>
            <td width="32%" bgcolor="#E8E8FF"><%=lrr%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF"> 
              ¼��ʱ��            </td>
            <td width="32%" bgcolor="#E8E8FF"><%=lrsj%> </td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">¼�벿��</td>
            <td width="32%" bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">�ͷ�������</td>
            <td width="32%" bgcolor="#E8E8FF"><%=slr%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">�ͷ�����ʱ��</td>
            <td width="32%" bgcolor="#E8E8FF"><%=slsj%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">��ע</td>
            <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#FF0033">*</font>����רԱ</td>
            <td>
			  <select name="kszy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='21' and sq_yhxx.sfzszg in('Y','N') order by yhmc",kszy);
%>
              </select>
			</td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#FF0033">*</font><font color="#0000CC">�ɵ���</font></td>
            <td><input type="text" name="kszypdr" value="<%=yhmc%>" size="20" maxlength="20" readonly>            </td>
            <td align="right"><font color="#FF0033">*</font><font color="#0000CC">�ɵ�ʱ��</font></td>
            <td><input type="text" name="kszypdsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>            </td>
          </tr>
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="hidden" name="tsjlh"  value="<%=tsjlh%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">              </td>
            </tr>
      </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kszy)=="") {
		alert("��ѡ��[����רԱ]��");
		FormName.kszy.focus();
		return false;
	}
	if(	javaTrim(FormName.kszypdr)=="") {
		alert("��ѡ��[�ɵ���]��");
		FormName.kszypdr.focus();
		return false;
	}
	if(	javaTrim(FormName.kszypdsj)=="") {
		alert("��ѡ��[�ɵ�ʱ��]��");
		FormName.kszypdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kszypdsj, "�ɵ�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
