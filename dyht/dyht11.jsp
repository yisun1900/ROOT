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
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,hth,lxfs,yxtxdz,fwmj,hxbm,kgrq,jgrq,wdzgce,fgsbh,dwbh,zqguanlif,zqsuijin";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
     ls_sql="select fkfabm";
	ls_sql+=" from  cw_khfkfa";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfabm=rs.getString("fkfabm");
	}
	rs.close();
	ps.close();
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
		a=((qye+guanlif+suijin)*0.55);
		b=((qye+guanlif+suijin)*0.40);
		c=((qye+guanlif+suijin)*0.05);
		rs.close();
		ps.close();
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
		a=((wdzgce+zqguanlif+zqsuijin)*0.55);
		b=((wdzgce+zqguanlif+zqsuijin)*0.40);
		c=((wdzgce+zqguanlif+zqsuijin)*0.05);
		rs.close();
		ps.close();
	}
	if("05".equals(fkfabm))
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
		a=((wdzgce+zqguanlif+zqsuijin)*0.55);
		b=((wdzgce+zqguanlif+zqsuijin)*0.40);
		c=((wdzgce+zqguanlif+zqsuijin)*0.05);
		rs.close();
		ps.close();
	}
	
		
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
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

<tr bgcolor="#FFFFFF"> 
    <td colspan="7"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <!--  <td align="right">http://www.jrchina.com</td> -->
  </tr>

   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><strong>����ͥ����װ��װ�޹���ʩ����ͬ���ײ�װ�޻����׼����</strong>   </td>
   </tr> 
   <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="3" height="35"><strong>��ͬ��ţ�<u><%=hth%></u></strong>   </td>
   <td width="23%" align="center"></td>
   </tr> 
    <tr bgcolor="#FFFFFF"> 
	<td width="23%" height="40"><strong>1����ͬ˫��</strong></td>
    <td width="36%">&nbsp;</td>
    <td width="18%">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">���������׷�����</td>
    <td><u><%=khxm%></u></td>
    <td>��ϵ�绰��</td>
    <td><u><%=lxfs%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">�׷������ˣ�</td>
    <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
    <td>��ϵ�绰��</td>
    <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">��ַ:</td>
    <td colspan="3"><u><%=fwdz%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">�а������ҷ�����</td>
    <td><u>�����ڴ�װ�ι��̣����������޹�˾ </u></td>
    <td colspan="2">�������ʵȼ�֤��ţ�
    <u>B30340110108162 </u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">Ӫҵִ�պţ�</td>
    <td><u>110105005815247</u></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <tr bgcolor="#FFFFFF">
    <td height="30">�칫�ص㣺</td>
    <td colspan="3"><u>�����з�̨����������·27�������ڴ�</u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">��������ˣ�</td>
    <td><u><%=sjs%></u></td>
    <td>��ϵ�绰��</td>
    <td><u><%=sjsdh%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">��Ŀ�����ˣ�</td>
    <td><u><%=zjxm%></u></td>
    <td>��ϵ�绰��</td>
    <td><u><%=zjdh%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40"><p><strong>2.���̸ſ� </strong></p></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">2.1 ���̵ص㣺</td>
    <td><u><%=fwdz%></u></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="30" colspan="2">2.2 �������ڽ��������
 <u><%=fwmj%></u>ƽ��</td>
    <td>���̻���:</td>
    <td><u><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </u></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="30">2.5 ʩ����ͬ��</td>
    <td>��<u><%=cf.formatDouble(a+b+c)%></u>Ԫ</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="30">&nbsp;</td>
    <td colspan="3">��д��<u><%=cf.NumToRMBStr(a+b+c)%></u></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="30">2.6 ���ڣ�</td>
    <td>��������:<u><%=kgrq%></u></td>
    <td colspan="2">�������ڣ�<u><%=jgrq%></u></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="40"><strong>10�����̿֧����ʽ </strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <tr  bgcolor="#FFFFFF">
    <td height="30">10.1��ͬ�֧����ʽ</td>
    <td height="30">&nbsp;</td>
    <td height="30">&nbsp;</td>
    <td height="30">&nbsp;</td>
  </tr>
   <tr  bgcolor="#FFFFFF">
    <td height="30" colspan="4" >10.1.1  һ���Ը�����ڱ���ͬǩ���󿪹�ǰ�����ڣ��׷������̺�ͬ���
��        <%=cf.formatDouble(a+b+c)%>          Ԫ���ҷ�һ����֧����</td>
  </tr>
   <tr bgcolor="#FFFFFF">
           <td  height="100">&nbsp;</td>
           <td>�׷�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
           <td colspan="2">�ҷ�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
		  <tr bgcolor="#FFFFFF" >
           <td height="30" colspan="4"><b> ��ע�����泯�ϣ�װ���ڡ���ͥ����װ��װ�޹���ʩ����ͬ�����һҳ</b></td>
         </tr>
</table>

</body>
</html>
 


