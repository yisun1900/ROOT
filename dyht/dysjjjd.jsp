<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
//String yhdlm=(String)session.getAttribute("yhdlm");
//String yhmc=(String)session.getAttribute("yhmc");
String fkfamc=null;
String ywy=null;
int gqts=0;
String jdrq=null;
String qyrq=null;
String crm_khxx_khlxbm=null;
String khjl=null;
String khxm=null;
String xb=null;
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
String sjs=null;
String hth=null;
String fwmj=null;
String zjxm=null;
String hxbm=null;
String kgrq=null;
String jgrq=null;
String fkfabm=null;
double wdzgce=0;
double zqguanlif=0;
double zqsuijin=0;
double guanlif=0;
double suijin=0;
double qye=0;
double a=0;
double b=0;
double c=0;
double sjf=0;
String bjjb=null;

String sjsdh="";
String zjdh="";
String ssfgs=null;
String dwbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,hth,lxfs,yxtxdz,fwmj,hxbm,kgrq,jgrq,wdzgce,fgsbh,dwbh,zqguanlif,zqsuijin,khjl,khlxbm,qyrq,jyjdrq,gqts,kgrq,jgrq,wdzgce,zqguanlif,ywy,sjf,bjjb";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    bjjb=cf.fillNull(rs.getString("bjjb"));
	    sjf=rs.getDouble("sjf");
	    ywy=cf.fillNull(rs.getString("ywy"));
	    gqts=rs.getInt("gqts");
	    jdrq=cf.fillNull(rs.getString("jyjdrq"));
	    qyrq=cf.fillNull(rs.getString("qyrq"));
	    crm_khxx_khlxbm=cf.fillNull(rs.getString("khlxbm"));
	    khjl=cf.fillNull(rs.getString("khjl"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
		//ssfgs=rs.getString("ssfgs");
		hth=rs.getString("hth");
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		
		hxbm=cf.fillNull(rs.getString("hxbm"));
	    wdzgce=rs.getDouble("wdzgce");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		//dh=cf.fillNull(rs.getString("dh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zqguanlif=rs.getDouble("zqguanlif");
		zqsuijin=rs.getDouble("zqsuijin");
	}
	 rs.close();
	 ps.close();
     ls_sql="select cw_khfkfa.fkfabm,cw_fkfabm.fkfamc";
	ls_sql+=" from  cw_khfkfa,cw_fkfabm";
	ls_sql+=" where cw_khfkfa.fkfabm=cw_fkfabm.fkfabm and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfabm=rs.getString("fkfabm");
		fkfamc=rs.getString("fkfamc");
	}
	rs.close();
	ps.close();
	
	
		
	ls_sql=" select zjxm from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
	
	}
	rs.close();
	ps.close();
	
	
	
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	
//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where  yhmc ='"+zjxm+"' and  zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	
	}	
  catch (Exception e) {
	//out.print("Exception: " + e);
    out.print("Exception: " + ls_sql);
	return;
 
   


	//���ʦ�绰

	/*	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�����绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	//ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();*/
	
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
<body>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px' height="5%">

<tr bgcolor="#FFFFFF"> 
    <td colspan="7"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <!--  <td align="right">http://www.jrchina.com</td> -->
  </tr>

   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><strong><h1>��ͬ���ӵ�</h1></strong></td>
   </tr> 
   </table>
   
  
   <div>
   <table border="1" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 14px' height="25%">
   <tr bgcolor="#FFFFFF">
     <td rowspan="8" align="center" width="5%">������Ϣ</td>
	 <td align="center" width="15%">��Ʒֲ�</td>
	 <td align="center" width="15%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
	%>
:
<%cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
	 <td align="center" width="15%">���ʦ</td>
	 <td align="center" width="15%"><%=sjs%></td>
	 <td align="center" width="15%">���ʦ�绰</td>
	 <td align="center" width="15%"><%=sjsdh%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">�ͻ�����</td>
	 <td align="center"><%=khjl%></td>
	 <td align="center">����Ա</td>
	 <td align="center"></td>
	 <td align="center">ҵ��Ա</td>
	 <td align="center"><%=ywy%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">�ͻ�����</td>
	 <td align="center"><%=khxm%></td>
	 <td align="center">�ͻ��绰</td>
	 <td align="center"><%=lxfs%></td>
	 <td align="center">��ͬ���</td>
	 <td align="center"><%=hth%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">������ϸ��ַ</td>
	 <td align="left" colspan="3"><%=fwdz%></td>
	  <td align="center">���ۼ���</td>
	 <td align="center"><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">��Ŀ���</td>
	 <td align="center"><%=fwmj%></td>
	 <td align="center">����˵��</td>
	 <td align="center"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%></td>
	 <td align="center">ǩԼ����</td>
	 <td align="center"><%=qyrq%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">�ͻ���Դ</td>
	 <td align="left"  colspan="5"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",crm_khxx_khlxbm,true);
%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">��Ŀ����</td>
	 <td align="center" colspan="2"><%=zjxm%></td>
	 <td align="center">��Ŀ������ϵ�绰</td>
	 <td align="center" colspan="2"><%=zjdh%></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">������������</td>
	 <td align="center" colspan="2"><%=jdrq%></td>
	 <td align="center">�ƻ�����</td>
	 <td align="center" colspan="2">(<%=gqts%>��)<%=kgrq%> �� <%=jgrq%></td>
   </tr>
  </table>
   </div>
   <br>
   <div>
    <table border="1" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 14px' height="10%">
	<tr bgcolor="#FFFFFF">
	  <td rowspan="2" width="5%">װ�޷�</td>
	  <td width="23%" align="center">����ֱ�ӷ�</td>
	  <td width="23%" align="center">�����</td>
	  <td width="23%" align="center">˰��</td>
	  <td width="26%" align="center">���ʽ(����/һ����)</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td width="23%" align="center"><%=wdzgce%></td>
	 <td width="23%" align="center"><%=zqguanlif%></td>
	 <td width="23%" align="center"><%=zqsuijin%></td>
	 <td width="26%" align="center"><%=fkfamc%></td>
	</tr>
	</table>
   </div>
   <br>
   <div>
    <table border="1" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 14px' height="10%">
	<tr bgcolor="#FFFFFF">
	  <td rowspan="2" width="5%" align="center">����</td>
	  <td width="33%" align="center">�ײ�������</td>
	  <td width="31%" align="center">��ͬ�ܼ�</td>
	  <td width="31%" align="center">����</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td width="23%" align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td width="23%" align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td width="23%" align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	</tr>
	</table>
   </div>
   <br>
     <div>
    <table border="1" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 14px' height="20%">
	<tr bgcolor="#FFFFFF">
	  <td rowspan="5" align="center" width="5%">������Ϣ</td>
	  <td rowspan="4" colspan="2" align="center"></td>
	  <td align="center" width="23%">�Ѹ���Ʒ�</td>
	  <td align="center" colspan="2">�������˵��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td rowspan="3"align="center"><%=sjf%></td>
<%
if("01".equals(fkfabm))
{
		ls_sql="select qye,guanlif,suijin from crm_khxx where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qye=rs.getDouble("qye");
			guanlif=rs.getDouble("guanlif");
			suijin=rs.getDouble("suijin");
		}
		if(bjjb.equals("B") ||bjjb.equals("D")||bjjb.equals("E")||bjjb.equals("F")||bjjb.equals("G")||bjjb.equals("H"))
		{
		a=((qye+guanlif+suijin)*0.70);
		b=((qye+guanlif+suijin)*0.25);
		c=((qye+guanlif+suijin)*0.05);
		}
		else{
		a=((qye+guanlif+suijin)*0.55);
		b=((qye+guanlif+suijin)*0.40);
		c=((qye+guanlif+suijin)*0.05);
		}
		rs.close();
		ps.close();
%>

<td align="center" width="23%">���ڽ���</td>
	<td align="center" width="23%"><%=cf.formatDouble(a)%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td align="center">���ڽ���</td>
	<td align="center"><%=cf.formatDouble(b)%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td align="center">ĩ�ڽ���</td>
	<td align="center"><%=cf.formatDouble(c)%></td>
	</tr>
<%		
	
	}
	if("02".equals(fkfabm))
	{
		ls_sql="select wdzgce,zqguanlif,zqsuijin from crm_khxx where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wdzgce=rs.getDouble("wdzgce");
			zqguanlif=rs.getDouble("zqguanlif");
			zqsuijin=rs.getDouble("zqsuijin");
		}
		if(bjjb.equals("B") ||bjjb.equals("D")||bjjb.equals("E")||bjjb.equals("F")||bjjb.equals("G")||bjjb.equals("H"))
		{
		a=((wdzgce+zqguanlif+zqsuijin)*0.70);
		b=((wdzgce+zqguanlif+zqsuijin)*0.25);
		c=((wdzgce+zqguanlif+zqsuijin)*0.05);
		}
		else
		{
		a=((wdzgce+zqguanlif+zqsuijin)*0.55);
		b=((wdzgce+zqguanlif+zqsuijin)*0.40);
		c=((wdzgce+zqguanlif+zqsuijin)*0.05);
		}
		rs.close();
		ps.close();
%>
<td align="center" width="23%">���ڽ���</td>
	<td align="center" width="23%"><%=cf.formatDouble(a)%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td align="center">���ڽ���</td>
	<td align="center"><%=cf.formatDouble(b)%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td align="center">ĩ�ڽ���</td>
	<td align="center"><%=cf.formatDouble(c)%></td>
	</tr>
<%		
	}
	if("05".equals(fkfabm))
	{
%>
<td align="center" width="23%">���ڽ���</td>
	<td align="center" width="23%"></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td align="center">���ڽ���</td>
	<td align="center"></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td align="center">ĩ�ڽ���</td>
	<td align="center"></td>
	</tr>
<%	
	}
%>	
	<tr bgcolor="#FFFFFF">
	<td width="26%" align="center">���������ļ�</td>
	<td colspan="4">
	��װ��ͬ<input type="checkbox" name="a">&nbsp;&nbsp;
	���ͼֽ<input type="checkbox" name="a">&nbsp;&nbsp;
	���۵�<input type="checkbox" name="a">&nbsp;&nbsp;
	����Э��<input type="checkbox" name="a"><br>
	����<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
	</td>
	</tr>
	</table>
   </div>
   <br>
     <div>
   <table border="1" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 14px' height="20%">
   <tr bgcolor="#FFFFFF">
     <td rowspan="8" align="center" width="5%">ǩ����</td>
	 <td align="center" width="15%">���ʦǩ��</td>
	 <td align="center" width="15%">�ŵ꾭��ǩ��</td>
	 <td align="center" width="15%">���ϲ��ӵ�ǩ��</td>
	 <td align="center" width="15%">���̲��ӵ�ǩ��</td>
	 <td align="center" width="15%">��Ŀ����ǩ��</td>
	 <td align="center" width="15%">��Ŀ�ɵ�</td>
	</tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center">ˮ������˽ӵ�ǩ��</td>
	 <td align="center">�ʼ첿�ӵ�ǩ��</td>
	 <td align="center">��Ʒ�ӵ�ǩ��</td>
	 <td align="center">���񲿽ӵ�ǩ��</td>
	 <td align="center" colspan="2">��������</td>
   </tr>
   <tr bgcolor="#FFFFFF">
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	 <td align="center" colspan="2"><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   </table>
    </div> 
 


</body>
</html>
 


