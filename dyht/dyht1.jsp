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
String lxfs=null;
String fwdz=null;
String sjs=null;
String hth=null;
String zjxm=null;
String fwmj=null;
String email=null;
String kgrq=null;
String jgrq=null;
String gqts=null;
String sgd=null;
String sgdmc="";
String sgddh="";


String hxbm=null;
String hxmc=null;
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
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,fwmj,email,hth,kgrq,jgrq,gqts,sgd,fgsbh,dwbh,hxbm,wdzgce,zqguanlif,zqsuijin";
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
		fwmj=cf.fillNull(rs.getString("fwmj"));
		email=cf.fillNull(rs.getString("email"));
		hth=rs.getString("hth");
		
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		gqts=cf.fillNull(rs.getString("gqts"));
		sgd=cf.fillNull(rs.getString("sgd"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		wdzgce=rs.getDouble("wdzgce");
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
		a=qye;
		/*a=((qye+guanlif+suijin)*0.60);
		b=((qye+guanlif+suijin)*0.35);
		c=((qye+guanlif+suijin)*0.05);*/
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
		a=wdzgce;
		/*a=((wdzgce+zqguanlif+zqsuijin)*0.60);
		b=((wdzgce+zqguanlif+zqsuijin)*0.35);
		c=((wdzgce+zqguanlif+zqsuijin)*0.05);*/
		rs.close();
		ps.close();
	}
	
	ls_sql="SELECT dh";
	ls_sql+=" FROM sq_sgd";
    ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString("dh"));
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
	
//���̵����绰
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
 
   
	
	}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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
    <td colspan="7"><span lang=EN-US></span></td>
    <!--  <td align="right">http://pesyddl.panasonic.cn/</td> -->
  </tr>

   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><strong>���̺�ͬ</strong>   </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 <td width="50%" height="35"  ><div align="right">��ͬ��ţ�<u><%=hth%></u></div></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35" colspan="2"  ><strong>�����ˣ�ȫ�ƣ���</strong>&nbsp;<u><%=khxm%></u>&nbsp;&nbsp;&nbsp;</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >ͨ�ŵ�ַ��<u><%=fwdz%></u></td>
	 <td width="50%" height="35"  >�ʱࣺ</td>
   </tr>
  <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >��ϵ��ʽ��<u><%=lxfs%></u></td>
	 <td width="50%" height="35"  >E-MAIL��<u><%=email%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35" colspan="2"  ><strong>�а��ˣ�ȫ�ƣ�����������ʱ��װ�ι������޹�˾&nbsp;&nbsp;</strong>&nbsp;&nbsp;</td>
   </tr>
   </table>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ա��л����񹲺͹���ͬ���������л����񹲺͹�������������סլ����װ��װ�޹���취���������йط��ɡ���������Ĺ涨����ѭƽ�ȡ���Ը����ƽ�ͳ��ŵ�ԭ�򣬽�ϱ�װ��װ�޹���ʩ�����������˫��Э�̴������Э�顣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��1��&nbsp;���̸ſ�</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1&nbsp;�������ƣ�<u><%=fwdz%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2&nbsp;���̵ص㣺<u><%=fwdz%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3&nbsp;�������ݣ���������<u>
      <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>
     </u>������<u>&nbsp;&nbsp;&nbsp;</u>�ף��ܽ������<u><%=fwmj%></u>ƽ���ס�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4&nbsp;�а���Χ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1�����ݷ�����ȷ�ϵ����ʩ��ͼ����װ��ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.5&nbsp;�а���ʽ��˫���̶���ȡ���е�<u>&nbsp;&nbsp;&nbsp;</u>�ֳа���ʽ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1���а��˰�����ȫ�����ϣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2���а��˰��������ֲ��ϣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3���а��˰����������˰��ϣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��4��˫��Լ���������а���ʽ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.6&nbsp;�������ڣ�<u><%=kgrq%></u>��ǩ����ͬ���ҷ�����֧���׸����а��˿������ҿ���������Ӧ˳�ӣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ڣ�<u><%=jgrq%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ڣ����������ڼ��գ���<u><%=gqts%></u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��2��&nbsp;��ͬ�ۿ���֧��</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.1&nbsp;��ͬ�ۿ��д�����<u><%=cf.NumToRMBStr(qye)%></u>&nbsp;(RMB&nbsp;<u><%=cf.formatDouble(qye)%></u>Ԫ)��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.2&nbsp;��ͬ�ۿ���÷�ʽ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;˫���̶�����ͬ�˸����ּۿ�ɼ��ˮ���硢���Ĳ��ְ�ʵ���㡣���ӵĹ�����Ŀ�ڹ���ǩ֤���ʱ��ȫ��֧����֧����ʼʩ�����粻�������а�����Ȩ�����������ʩ������������ֹ���Ӱ�����幤�ڣ�������Ӧ˳�ӣ��а��˲��е��κ����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.3&nbsp;���ʽ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1����ͬǩ���������ڣ�֧���˸����ֺ�ͬ�ۿ�� 60% ������<u><%=cf.formatDouble((a+b+c)*0.6)%></u>Ԫ����Ϊ�׸��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2�����������깤�����ڣ�֧���˸����ֺ�ͬ�ۿ�� 35% ����:<u><%=cf.formatDouble((a+b+c)*0.35)%></u>Ԫ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3��ˮ�������ι��̽���������д˴ι��̽��㣬����������֧��ǰ���ڶ��ʿ�ʱ�����ٲ�һ�����壻</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��4���������պ������ڣ����㲢������δ����β����Ϊ�������ޣ��а��˶Ա���Ŀ���е��������Σ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��5������̿�������Ĳ��֣���ȫ��֧���󷽿�ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��6���򷢰����ṩ�����ĵ����ӳ٣���Ӱ��а��˾����깤���ֽ��н��㡣�緢�����Դ�Ϊ�ɲ����н��㣬ÿ����һ����֧�����а���50Ԫ���ɽ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��3��&nbsp;ʩ��ͼֽ</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;˫���̶�ʩ��ͼֽ��ȡ���е�<u>&nbsp;&nbsp;&nbsp;</u>�ַ�ʽ�ṩ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1�������������ṩʩ��ͼֽ��ͼֽһʽ���ݣ������ˡ��а��˸�һ�ݡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2���ɳа������ʩ��ͼֽ��ͼֽһʽ���ݣ������ˡ��а��˸�һ�ݡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��4��&nbsp;�����˹���</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1&nbsp;ָ��<u><%=zjxm%>��<%=zjdh%>��</u>Ϊ������פ���ش��������ͬ���С��Թ������������ȡ����Ͻ������мල��飬�������ա�������Ǽ��������������ˡ��ô���Թ������������ȡ����ϼ��ۿ��ǩ��ȷ�Ͼ���Ϊ�����˵���Ϊ���ɷ����˳е����Ρ������˱��ǰ������ģ��輰ʱ����֪ͨ�а��ˣ�������Ϊδ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2 &nbsp;��������ǰ��������ҪΪ�а����볡ʩ�������������Բ�Ӱ��ʩ��Ϊԭ�򡣰�����������ҵ���߷��ݹ�����������걨�Ǽǣ���Ӧ������ҵ����λǩ��װ��װ�޹������Э�飬�������ܼල���������������������ɷ�����Ӧ֧�����йط��á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.3&nbsp;������Ӧ���ط��ݹ����������ҵ�ȹ����ŵĸ�������ƶȡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.4&nbsp;����Ҫ���ԭ��������ͳ��ؽṹ���豸���ߣ�ˮ���硢ů����ú���ܵ����������˸����йز��Ű�������������������δ�����й��������а�����Ȩ�Դ˲��ֲ���ʩ�������������Բ��ԭ������ṹ���豸���߻�ú����ܣ���ů������ˮ��Ҫ���ߣ���ɵ���ʧ�������ɷ����˳е���ԭ��������ͳ��ؽṹ���豸���ߣ�ˮ���硢ů����ú���ܵ�����ǩ����ͬǰ�ѱ���Ĺ��ģ��ɷ����˸�����а���˵�����е����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.5&nbsp;��а����ṩʩ�������ˮԴ����Դ����˵��ʹ��ע���������Э������Χ����Ĺ�ϵ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.6&nbsp;�������Ӱ��ʩ�����ϰ���Է������������ļҾߡ�����Ȳ�ȡ������ʩ���е����ã���ʩ�������У��򷢰���δ��ȡ����ı�����ʩ���²Ʋ��𻵵ģ��ɷ����˳е����Σ���а����޹ء�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.7&nbsp;����ǰӦȷ��ʩ��ͼֽ������˵��������а��˽����ֳ����ס�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.8&nbsp;����װ��װ�������������Ĵ��������е�����������ķ��á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.9&nbsp;�������밴���Թ���Ʒ�������Ŀ�������ڱ�������ص�λ���Ʒ׼ʱ�����������ճа����ֳ�ʩ������涨Ҫ��ʩ���������ɷ����˳е�������μ���ʧ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.10&nbsp;�����˲��ý��а����ṩ��ʩ��ͼֽ����Ʒ������������Ը��ƻ�ת�ø���������Ҳ�������ڱ���ͬ�������Ŀ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.11&nbsp;����������а����״νӴ�������ͬ������Ϲ����в��������̽�а��˵���ҵ���ܣ������а��˵ļ�����Ϣ����Ӫ��Ϣ���ͻ���Ϣ�ȣ����������֪���а��˵���ҵ���ܣ��������뱣֤��������������а��˵�ͬ��й¶���֪�����򷢰�����е��ɴ������ķ������Σ���˶����а��������ʧ�ģ��ɷ����˳е��⳥���Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.12&nbsp;ʩ�������У�������δ��а��˴���Э��˽��Ҫ���˸���ʩ�����ݣ�����������������ɷ����˳е����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.13&nbsp;�����˸����Թ���Ʒ�İ��ˡ����ա��˻������޵����˼��е���ط��á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.14&nbsp;δ����������������������ǰʹ�û����Զ��ã���Ϊ�����ѿ����������������պϸ��ɴ˲����Ĺ����������μ������ʧ�ɷ����˸���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.15&nbsp;�ڹ���ͣ���ڼ䣬�ɷ����˸�����ֳ���һ����ʩ�͹��̳�Ʒ���б������ڳа����ٴν���ʩ��ʱ��˫�����ֳ���ʩ�����̳�Ʒ���н���ȷ�ϡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.16&nbsp;�ɷ���������ʩ���Ĺ�����Ŀ��Ӧ�ɷ��������ó�Ʒ��������ò��ֹ��̷�����ί�га��˱������а��˽���ȡ��Ӧ�ķ��á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.17&nbsp;������������ϵ�绰��ͨѶ��ַ��E-mail ����Ϣ�뱣֤��ʵ��Ч���а��˽�ͨ����������������ϵ�绰��ͨѶ��ַ��
E-mail���������Ͱ���������������֪ͨ���߿�֪ͨ�����ڵ�һ���ļ�������������Ϣ���󣬷�����δ�ӵ��а��˷�����֪ͨ������Ϊ���������յ��а�����������֪ͨ���Ͽ�֪ͨ���ݣ�������֪ͨ���ݶ�׷���а���������Ρ��а������ݷ���������������ϵ��ʽ���͵���Ӧ֪ͨ�����������в����뱾��ͬ����ͬ�ȷ���Ч����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��5��&nbsp;�а��˹���</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.1&nbsp;ָ��<u><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>��<%=sgddh%>��</u>Ϊ�а���פ���ش�����Ҫ����֯ʩ�������ʡ��������������ʩ������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.2&nbsp;�ϸ���ͼֽ������˵����������׼����ʩ�������ø�����������¼���ϸ�ִ��ʩ���淶����ȫ������̡�����ȫ�涨�����������涨���μӿ������գ����ƹ��̽��㡣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.3&nbsp;�а����򷢰����Ƽ�ʹ�ò����Ϲ��ұ�׼��װ��װ�޲��ϣ���ɾ�����ʧ�ģ��ɳа��˳е���Ӧ���Σ������Ⱦ��������Ͽɵģ��а������ڳе����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.4&nbsp;�ϸ����ع涨��װ��װ��ʩ��ʱ�䣬����ʩ�����������ٻ�����Ⱦ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.5&nbsp;δ��������ͬ�⼰�йز�����׼��ʩ���в���������ԭ������ṹ�������豸���ߡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.6&nbsp;����ͬ��4.6������4.15���͵�4.16��Լ���⣬���̿���δ�ƽ�������֮ǰ�������ɿ����¼��⣬������ֳ���һ����ʩ�͹��̳�Ʒ���б�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��6��&nbsp;���Ϲ�Ӧ</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.1&nbsp;װ��װ�޹���ʹ�õĲ��Ϻ��豸������Ϲ��ұ�׼����ֹʹ�ù���������̭�Ľ���װ��װ�޲��Ϻ��豸��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.2&nbsp;�ɷ����˹�Ӧ�Ĳ��ϡ��豸�������������������죬�Թ��������ʧ�������ɷ����˳е���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.3&nbsp;���ɳа��˲ɹ��Ĳ��ϡ��豸Ӧ������ƺ͹淶Ҫ��ɹ�������Ҫ�Ĳ��ϣ��粻��������Ҫ������в��죬Ӧ��ֹʹ�á�����ʹ�ã��Թ�����ɵľ�����ʧ�ɳа��˳е���Ӧ���Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��7��&nbsp;��ȫ�����ͷ���</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.1&nbsp;�������ṩ��ʩ��ͼֽ������˵����Ӧ���ϡ��л����񹲺͹������������йط�����ƹ淶��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.2&nbsp;�������ṩȷ�ϵ�ͼֽ������˵����Υ���йذ�ȫ������̡������涨�ͷ�����ƹ淶�����·�����ȫ������¹ʣ�������Ӧ�е��ɴ˲�����һ�о�����ʧ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.3&nbsp;�а��˽���װ��װ�޻��Ҫ�ϸ�����ʩ����ȫ������̣����չ涨��ȡ��Ҫ�İ�ȫ������������ʩ���������Զ�������ͽ��к�����ҵ����֤��ҵ��Ա����Χס�����Ʋ��İ�ȫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.4&nbsp;���ڳа�����װ��װ����ƺ�ʩ��������Υ�����������йذ�ȫ������̣����·�����ȫ������¹ʣ�Ӧ�е��ɴ�������һ�о�����ʧ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��8��&nbsp;��������������</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.1&nbsp;˫��Լ������������Ӧ�ﵽ�������������ϸ��׼��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.2&nbsp;�������̵ȼ����ӵľ���֧����ʡ���йع涨ִ�С�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.3&nbsp;��������ʩ��ͼֽ������˵������Ʊ���������ƶ�������װ��װ��ʩ�������չ淶Ϊ�����������ձ�׼��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.4&nbsp;���а�˫��Ӧ��ʱ�������ι��̺��м�ļ���������������а���������ǰ1��֪ͨ�����ˣ������˲���ʱ�μ����ι��̺��м����գ��а��˿��������գ���Ϊ������ȷ�ϳа��˵����������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.5&nbsp;���̿����ռ������գ����й��ڱ���������һ����׼�ı������Ϊ׼����������Ӧ���п������ա��緢���˲���ʱ���п������գ���Ϊ������ȷ�ϳа��˵����������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.6&nbsp;�ڿ���������˫��ȷ�ϵĹ����������⣬�а��˸���ά�ޣ���ά���ڼ䲻���빤�ڡ�ά�޽����ռ�Ϊ�����ա�������Ӧ���п������ա��緢���˲���ʱ���п������գ���Ϊ������ȷ�ϳа��˵����������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.7&nbsp;װ��װ�޹��̿����󣬳а��˸���ɹ��ĵ����豸��Ӧ���򷢰����ύ�ѴӲ��Ϲ�Ӧ�̴�ȡ�õ�����ļ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��9��&nbsp;���̱��</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.1&nbsp;�����˶Թ�����Ŀ��ʩ����ʽ��������˫����Ӧ��ʱ������Ǣ��ǩ֤�����ܽ��жԱ����Ŀʩ�������Դ�Ϊ���ݱ����Ӧ�ۿ���ڡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.2&nbsp;�а���������������漰����Ʊ���Ͷ�ԭ�����ϵĻ��ã����뷢����Э�̽����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.3&nbsp;���պ�ͬ�涨������̿�δȫ��֧��ǰ������̲���ʩ�����ɴ����ӵĹ��ڼ�������ʧ�ɷ����˳е���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��10��&nbsp;����</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.1&nbsp;������δ��ʱ���п������յģ��а������պϸ�󣬽�֪ͨ�����˽��й��̽��㣬�Գа���֪ͨ7���ڣ�������δ��ʱ��а��˽��п������㣬��Ϊ�������Ͽɳа��˵Ĺ��̾��������˲����پͿ�����������������顣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.2&nbsp;�����˰�ʱ���п������յģ�Ӧ�ڹ��̿������պϸ��7������а��˽��й��̽��㣬������δ��ʱ��а��˽��п������㣬��Ϊ�������Ͽɳа��˵Ĺ��̾��������˲����پͿ�����������������顣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.3&nbsp;���̽������ȷ�Ϻ󣨼�10.1����10.2��������£��������˼�ʱ��а��˽��幤��β�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��11��&nbsp;���̱���</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.1&nbsp;���̿�Ӧ����ͬԼ����ʱ��ȫ�����塣�����˾ܾ�������֧��ʣ�๤�̿�ģ���Ϊ�����˷������ޣ��а��˶Ա���Ŀ���е��������Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.2&nbsp;�а��˶�סլ���� װ��װ�޹��� ������Ϊ���꣬װ�޲��ϼ���Ʒ������Ϊһ�꣬��Դ������Ϊ�����£���ˮ���꣬�����г�ά������װ�޹��̿������պϸ�֮������㡣������Ҫ��ά��ʱ������а����ύ���㷢Ʊ������ƾ֤��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.3&nbsp;�����������ڳа���ʩ���������⣬�а��˸���ά�ޡ��Ǳ��޷�Χ�������˲��������ά�޻�������񡣣��������
1 ���������飩</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��12��&nbsp;ΥԼ����</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.1&nbsp;���ڷ�����ԭ�������ڿ�������;ͣ����Ӧ�е�ΥԼ���Ρ�ÿͣ�����ѹ�һ�죬������֧�����а���RMB50.00ԪΥԼ�𣬵�ΥԼ���ܶ����5000Ԫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.2&nbsp;���ڳа���ԭ����ʹ��������ÿ����һ�죬�а���֧����������RMB50.00ԪΥԼ�𣬵�ΥԼ���ܶ����5000Ԫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.3&nbsp;�������ڽӵ��а��˵Ľ��ȿ��֪ͨ3���ڣ�Ӧȫ��֧�����̽��ȿ���ڲ������а�����Ȩͣ������ͣ���մﵽ10�շ�������δ֧�����ȿ�а�����Ȩ��ֹ��ͬ����ֹ��ͬ��˫������ʩ�����ֽ��н��㡣�����˽������ͣ����ɵĹ������ڣ�����Ӧ˳�ӡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.4&nbsp;��һ��ԭ�򣬺�ͬ�޷���������ʱ��Ӧ��ǰʮ����������ʽ֪ͨ�Է��������ͬ��ֹЭ�飬�������η��⳥�Է��ɴ���ɵľ�����ʧ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.5&nbsp;�����˲���ʱ���㣬����а���֧��ΥԼ�𣬴ӳа���֪ͨ����֮����ÿ����һ�죬������֧�����а���RMB50.00ԪΥԼ�𣬵�ΥԼ���ܶ����5000Ԫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.6&nbsp;��ͬǩ����˫�������޹ʽ����ͬ����һ�������ͬ������Է�֧��ΥԼ��ΥԼ���Ϊ��ͬ����30%�繤���ѿ���������������а���֧����ʩ�����ֵĹ��̿</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.7&nbsp;��ͬǩ�����򷢰���ԭ����˲�Ʒ��δ��İ�װ�������ռ��������������а���֧�����˲�Ʒ����30%�Ĺ�����ã���ñʷ��õ��ڸ��а�����ɵ�ʵ����ʧ�������˻��貹����֡����ڲ�İ�װ����ʹ�õĲ�Ʒ���а��˲����˻���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.8&nbsp;�򲻿ɿ�����ԭ������а����޷����к�ͬ���񣬲��е�ΥԼ���Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��13��&nbsp;����Ľ����ʽ</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;13.1&nbsp;����ͬ�����й����з��������飬��˫��Э�̽����Ҳ�����йز��ŵ��⣻Э�̻���ⲻ�ɵģ�������а������ڵ�����Ժ���ߡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��14��&nbsp;���ɿ���</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;14.1&nbsp;����ͬ�еĲ��ɿ�������ս�������ҡ����з�����׹��������Ƿ����ˡ��а���������ɵı�ը�����֣��Լ��硢�ꡢ�顢�����Ȼ�ֺ��¼���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;14.2&nbsp;���ɿ����¼�������˫��������Ӧ������ȡ���ȴ�ʩ������δ�ܱ�����ʧ������£��ɲ����⳥���Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��15��&nbsp;����</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;15.1&nbsp;�а��˸������ʩ����Ա�����˺����ա�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��16��&nbsp;����</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;16.1&nbsp;����ͬδ�����ˣ�˫����Э��ǩ�������������������Ϊ����ͬ����ɲ��֣�Ч����ͬ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;16.2&nbsp;����ͬ������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����1��סլ����װ��װ������������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����2������װ��װ��ʩ��ͼ</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����3��װ�޹��̣�Ԥ������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����4�������������ͻ���֪��ͼֽ�����۵�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��17��&nbsp;��ͬ��Ч</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;17.1&nbsp;��˫��ǩ�ָ���֮���𣬺�ͬ��Ч�� ˫��ǩ�ָ������ڲ�һ�µģ������ǩ�ָ��µ�����Ϊ׼��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��18��&nbsp;��ͬ����</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����ͬ�������ݣ�����ͬ��Ч�����ɷ����˱���Ҽ�ݣ��а��˱��淡�ݡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��19��&nbsp;��ͬ��������֤</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��ͬ��������֤�����ֳ�ǩ�֣�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�����������ģ�</td>
   </tr>
</table>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ������ڴ�װ�ι��� (����)���޹�˾</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��Ч֤���ţ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���������ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��Ȩί���ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��Ч֤���ţ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;�쵼��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;</td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     </table>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;
     <div align="center"><strong>����1��סլ����װ��װ������������</strong></div></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;�����ˣ�ȫ�ƣ���<u><%=khxm%></u></strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;�а��ˣ�ȫ�ƣ��������ڴ�װ�ι��̣����������޹�˾</strong></td>
   </tr>

   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹�������������סլ����װ��װ�޹���취���������йط��ɡ���������Ĺ涨����Э��һ�£���<u><%=fwdz%></u>������ȫ�ƣ�ǩ��װ�����������顣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;һ��װ�޹����������޷�Χ������</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�а����������������ڣ������йط��ɡ����桢���µĹ���涨��˫��Լ�����е���װ�޹��������������Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�������޷�ΧΪ�а��˰��չ��̺�ͬΪ�����˹���Ĳ��ϡ��豸��װ��ʩ���Ĺ�����Ŀ��˫������Լ���ĳ��⡣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;��������������</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�а��˶�סլ����װ��װ�޹��̱�����Ϊ���꣬װ�޲��ϼ���Ʒ������Ϊһ�꣬��Դ������Ϊ�����£���ˮ���꣬�����г�ά������װ�޹��̿������պϸ�֮������㡣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;����������������</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1���а��˽ӵ����޼�Ͷ��绰���ڹ涨��ʱ���ڵ������ʣ���Ӱ���������¹���6Сʱ�ڵ������账�����ڸ��ӵ��¹���������ʮ���ڽ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2������������ɺ��ɷ�������֯���ա�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3�������豸������ˮ����ȼ��������̻��ȣ��ɷ����˳ֱ��޿�ֱ�������̱��ޣ���а����޹ء�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;�ġ����޷���</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.�����κ�һ������������˲����������ά�޻����������а���ά�ޣ������ɷ����˳е���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1&nbsp;�ɷ������Բɲ��ϡ��豸����ί���̣�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2&nbsp;δ���涨��������ʹ�ã����и������ɵĹ��ϻ��𻵣�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3&nbsp;����֡�����ˮ�֡��׵���������֡���������ʪ���������쳣��ѹ��ʹ��ָ�����Դ����ѹ��Ƶ�ʣ�����ɵĹ��ϻ��𻵣�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4&nbsp;��������а������ε����ɶ���ɵĹ��ϻ��𻵡�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.5&nbsp;���̿������պ��������˳���6����δ��ס�����ڿ������ڸ�����ɵ�ǽ�������������ѡ���Ƥ��ʯ��塢ľ�ʵ������ο��Ѽ�ľ�ʼҾ߱��ο��ѵ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2. ������������ά��ֻ�����Ӱ��ʹ�ò�λ���д�����������������ά�޺͸ı�ԭ��Ʒ����������¾ɼ�ɫ��ԭ��Ӱ�����ۡ�������Ҫ�����崦��ģ��а����������շѡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3. �������ڳ���ά��������а���ֻ����ά�ޣ��������⳥�������κ����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4. ������֮�󷢰��������ά��ʱ��ά�޷����ɷ��������и������շѱ�׼���а����շѱ�׼ִ�С�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;�塢����</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1����������ʹ��ǰ������ϸ�Ķ����豸ʹ��˵���顱����а���ʩ�����Ž�����ѯ����ȷʹ�á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2����ά���ڼ���а���ԭ�����������¹ʣ����ͣˮʱ�䡢ͣ��ʱ���ά��ʱ�䳬��ʮ�죬ʹ�������޷���ס���ɳа��˸�����Ӧ�Ĳ�����������һ����Ϊ�����1000Ԫ���÷��ð����������ڷ����˼���������˶������ķ������޷ѡ��󹤷ѡ�����ο������з��á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3. ��������Ϊ���̺�ͬ����������Ч��������������</td>
   </tr>
 </table>
</body>
</html>
