<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String ztjjgw=null;
String clgw=null;
String xmzy=null;
String jjsjs=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;

String fgsbh=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String gys=null;
String ppmc=null;
String ddlx=null;

double wdzje=0;
double hkze=0;
double zczkl=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;

double zcyfk=0;

double zcfk=0;
double htze=0;
String txxx="";

String ssfgs=null;
String zjxbh=null;
int count=0;

String djlrfs="";//���Ķ�������¼�뷽ʽ  1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
String kgcxhdbl="";//���Ķ����Ƿ�ɸĴ��������  Y���ɸģ�N�����ɸ�

String sxhtsfysh="";

String lx="";

try {
	conn=cf.getConnection();

	ls_sql="select count(*) ";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt='00' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("������������δ��ɣ����ܼ���¼���µ����뵽ά���а�����ɻ�ɾ��");
		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and sxhtsfysh='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("��������������д��ͬδ��ˣ�����¼�����");
		return;
	}

	String clzt="";
	ls_sql="select clzt,sxhtsfysh,wdzje,jc_zcdd.hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze,dzyy,zczkl,ddlx,ztjjgw,zcdlbm,zcxlbm,ppbm,gys,ppmc,khbh,clgw,jjsjs,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		ddlx=cf.fillNull(rs.getString("ddlx"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		clgw=cf.fillNull(rs.getString("clgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	if (clzt.equals("30") && xclbz.equals("2"))
	{
		out.println("����Ʒ�����󣬲���¼�����");
		return;
	}

	if (sxhtsfysh.equals("N"))
	{
		out.println("<BR><strong><font color=\"#FF0000\">������д��ͬδ��ˣ�����¼�����</font></strong>");
		return;
	}

	ls_sql="select fgsbh,khxm,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	String bjjb="";
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	//Ԥ����
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and clzt>'07' and clzt not in('98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (htze-zcfk > zcyfk)
	{
		txxx="<B><font color='#FF0000'>���ѣ��ͻ�Ӧ�����"+cf.round(htze-zcfk-zcyfk,2)+"�������ܶ"+htze+"�������Ѹ��"+zcfk+"������Ԥ�������:"+zcyfk+"</font></B>";
	}


	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();


	ls_sql="select NVL(max(substr(zjxbh,10,2)),0)";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zjxbh=ddbh+cf.addZero(count+1,2);

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


<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%">���������</td>
		<td  width="10%">����״̬</td>
		<td  width="8%">�ͻ�����</td>
		<td  width="16%">��Ʒ��</td>
		<td  width="10%">�������ܶ�</td>
		<td  width="10%">�������ʱ��</td>
		<td  width="10%">¼��ʱ��</td>
		<td  width="26%">��ע</td>
	</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','¼��δ���','01','¼�������','02','��ȷ��','03','���ͻ�','99','�˵�'),crm_khxx.khxm,jc_zczjx.ppbm,jc_zczjx.zjxze,jc_zczjx.zjxfssj,jc_zczjx.lrsj,jc_zczjx.bz";
		ls_sql+=" FROM crm_khxx,jc_zczjx";
		ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh";
		ls_sql+=" and jc_zczjx.ddbh='"+ddbh+"'";
		ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
	//	out.println(ls_sql);
		pageObj.sql=ls_sql;
	//���ж����ʼ��
		pageObj.initPage("","","","");
		pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


	//�����г�������
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"zjxbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="ViewJc_zczjx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("zjxbh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��

		
		pageObj.out=out;
		pageObj.getDate(1);
	pageObj.displayDateSum();

	%> 
	</table>
	<%
}
%>

<table width="100%">
  <tr>
    <td width="100%" align="center"> 
      <div align="center"> ��¼������������������ţ�<%=zjxbh%>��
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" bgcolor="#CCCCFF"> 
                �ͻ����              </td>
              <td width="40%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                ��ͬ��              </td>
              <td width="26%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right">�ͻ�����</td>
              <td width="40%"><%=khxm%></td>
              <td width="18%" align="right">�ʼ�</td>
              <td width="26%"><%=zjxm%></td>
            </tr>
            <tr> 
              <td width="16%" bgcolor="#CCCCFF" align="right">���ݵ�ַ</td>
              <td width="40%" bgcolor="#CCCCFF"><%=fwdz%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">��װǩԼ��</td>
              <td width="26%" bgcolor="#CCCCFF"><%=qye%></td>
            </tr>
            <tr> 
              <td width="16%" bgcolor="#CCCCFF" align="right">���桢���ʦ</td>
              <td width="40%" bgcolor="#CCCCFF"><%=dwmc%>��<%=sjs%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">��װǩԼ����</td>
              <td width="26%" bgcolor="#CCCCFF"><%=qyrq%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right"> 
                ʩ���ӡ��೤              </td>
              <td width="40%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>                ��<%=sgbz%></td>
              <td width="18%" align="right"> 
                ��ͬ������������              </td>
              <td width="26%"><%=kgrq%>---<%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">�μӴ����</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">�������ʡ��ص�</td>
              <td width="40%"><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%>��<%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
              <td width="18%" align="right">��ĿרԱ</td>
              <td width="26%"><%=xmzy%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right"> 
                פ��Ҿӹ���              </td>
              <td width="40%"> <%=clgw%> </td>
              <td width="18%" align="right"> 
                չ���Ҿӹ���              </td>
              <td width="26%"><%=ztjjgw%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">�������־</td>
              <td width="40%"><%
	cf.selectToken(out,"1+�������&2+�ȴ�����֪ͨ&3+������֪ͨ&4+�Ѳ���",xclbz,true);
%></td>
              <td width="18%" align="right">�ƻ�����ʱ��</td>
              <td width="26%"><%=jhclsj%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right"> 
                �ȴ��ͻ�֪ͨ              </td>
              <td width="40%"><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
              <td width="18%" align="right"> 
                ��ͬ�ͻ�ʱ��              </td>
              <td width="26%"><%=htshsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">ǩ��ͬʱ��              </td>
              <td width="40%"><%=qhtsj%> </td>
              <td width="18%" align="right">�ɼ����ֹʱ��              </td>
              <td width="26%"><%=kjxsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td colspan="3" bgcolor="#FFFFCC"><%=txxx%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><strong>�����ܶ�</strong></font></td>
              <td bgcolor="#FFFFCC"><%=htze%></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>�����Ѹ���</b></font></td>
              <td bgcolor="#FFFFCC"><%=zcfk%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>����Ԥ����</b></font></td>
              <td bgcolor="#FFFFCC"><%=zcyfk%></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>Ԥ�������</b></font></td>
              <td bgcolor="#FFFFCC"><%=cf.round(zcyfk-(htze-zcfk),2)%></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>��ǰ����ͬ��</b></td>
              <td><%=wdzje%></td>
              <td align="right"><b>�ۺ󣭺�ͬ��</b></td>
              <td><%=hkze%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>��ǰ����������</b></td>
              <td><%=zqzjhze%></td>
              <td align="right"><b>�ۺ���������</b></td>
              <td><%=zjhze%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>��ǰ��������ϼ�</b></td>
              <td><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
              <td align="right"><b>�ۺ�������ϼ�</b></td>
              <td><%=cf.formatDouble(hkze+zjhze)%> </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>�����������</b></td>
              <td><%=htcxhdje%><font color="#FF0000">��<b>��ͬ</b>��</font></td>
              <td align="right"><b>�����������</b></td>
              <td><%=zjxcxhdje%><font color="#FF0000">��<b>������</b>��</font></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>�����������</b></td>
              <td><%=cf.formatDouble(htcxhdje+zjxcxhdje)%><font color="#FF0000">��<b>������ϼ�</b>��</font></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><font color="#0000FF"><strong>��ͬ�ۿ�</strong></font></td>
              <td colspan="3"><%=zczkl%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><font color="#0000FF"><strong>��ͬ����ԭ��</strong></font></td>
              <td colspan="3"><%=dzyy%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">��ͬ��ע</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#FFFFFF" align="right"><font color="#FF0033">*</font><font color="#0000CC">���Ĵ���</font></td>
              <td width="40%"> 
                <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="26%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">��Ʒ��</font></td>
              <td width="40%"> 
                <input type="text" name="ppbm" value="<%=ppbm%>" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�������ܶ�</font></td>
              <td width="26%"><input type="text" name="zjxze" value="0" size="20" maxlength="9" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�������ۿ�</font></td>
              <td width="40%"><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zczkl%>" >
                <b><font color="#0000FF">��>0��<=10��</font></b></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="26%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���������ԭ��</td>
              <td colspan="3"><textarea name="dzyy" cols="80" rows="2" ><%=dzyy%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC"></font>������ԭ��</td>
              <td width="40%"><select name="zczjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm","");
%>
              </select></td>
              <td width="18%" align="right"><font color="#FF0033">*</font>��ͬ�ͻ�ʱ��</td>
              <td width="26%"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0033">*</font>�������ʱ��              </td>
              <td width="40%">
                <input type="text" name="zjxfssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font>              </td>
              <td width="26%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font>              </td>
              <td width="40%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">¼�벿��</font>              </td>
              <td width="26%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">�����ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="80" rows="2"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zcxlbm" value="<%=zcxlbm%>" readonly>
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="ddlx" value="<%=ddlx%>" >
                <input type="hidden" name="zjxbh" value="<%=zjxbh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
				<input type="hidden" name="zcdlbm" value="<%=zcdlbm%>" >
				<input type="hidden" name="zcxlbm" value="<%=zcxlbm%>" >
				<input type="hidden" name="ppbm" value="<%=ppbm%>" >
				<input type="hidden" name="gys" value="<%=gys%>" >
				<input type="hidden" name="ppmc" value="<%=ppmc%>" >
				<input type="hidden" name="clgw" value="<%=clgw%>" >
				<input type="hidden" name="ztjjgw" value="<%=ztjjgw%>" >
				<input type="hidden" name="xmzy" value="<%=xmzy%>" >
				<input type="hidden" name="jjsjs" value="<%=jjsjs%>" >
				<input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
				<input type="hidden" name="qddm" value="<%=dmbh%>" >
				<input type="hidden" name="jzsjs" value="<%=sjs%>" >
				<input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="���" onClick="f_wc(insertform)" name="wc" disabled>
                <input type="button"  value="��ӡ��ͬ" onClick="window.open('/jcjj/dygl/zcfjzjx.jsp?zjxbh=<%=zjxbh%>')" name="dy" disabled>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button"  value="�����޸���ϸ" onClick="f_plxg(insertform)" name="plxg" disabled>
		  <input type="button"  value="�����޸���ϸ" onClick="f_dpxg(insertform)" name="dpxg" disabled>
                <BR>
                <BR>
                <input type="button"  value="����[�ѹ���]�ͺ�" onClick="f_oldp(insertform)" name="oldp" disabled>
                <input type="button"  value="¼�룭�����ͺ�" onClick="f_lrxh(insertform)" name="lrxh" disabled>
                <input type="button"  value="¼�룭��ѯ�ͺ�" onClick="f_cxxh(insertform)" name="cxxh" disabled>
              <input type="button"  value="¼����д��Ŀ" onClick="f_newpsx(insertform)" name="newpsx" disabled>                </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zczjxyybm)=="") {
		alert("��ѡ��[������ԭ��]��");
		FormName.zczjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxze)=="") {
		alert("������[�������ܶ�]��");
		FormName.zjxze.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxze, "�������ܶ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "�������ʱ��"))) {
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "�������ۿ�"))) {
		return false;
	}



	FormName.action="SaveInsertJc_zczjx.jsp";
	FormName.submit();
	FormName.oldp.disabled=false;

	if ("<%=lx%>"!="2")//1�����ײͣ�2���ײ�
	{
		FormName.newpsx.disabled=false;
		FormName.lrxh.disabled=false;
		FormName.cxxh.disabled=false;
	}


	FormName.plxg.disabled=false;
	FormName.dpxg.disabled=false;
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;
	
	return true;
}

function f_oldp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrxh(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";

	FormName.submit();
	return true;
}

function f_cxxh(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}

function f_newpsx(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtDj.jsp";
		<%
	}
	else if (djlrfs.equals("2"))
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtZk.jsp";
		<%
	}
	else
	{
		%>
		FormName.action="InsertJc_zcddmxSxht.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_plxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			%>
			FormName.action="EditAllDjBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllDjJc_zcddmx.jsp";
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			%>
			FormName.action="EditAllZkBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllZkJc_zcddmx.jsp";
			<%
		}
	}
	else
	{
		%>
		FormName.action="EditAllNoJc_zcddmx.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_dpxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zczjxmxList.jsp";

	FormName.submit();
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zczjx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
