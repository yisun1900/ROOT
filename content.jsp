<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String zwbm=(String)session.getAttribute("zwbm");

String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
%>
<title>��������</title>
</head>
<body  background="99999.jpg">
<div align="center">
  <table width="100%" border="0"  >
    <tr>
      <td height="147" colspan="2">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="2"><b><font color="#FF0000" class="3dfont" face="����" style='FONT-SIZE: 46px'>��װ������Ϣϵͳ</font></b> 
	  <BR>
	  <A HREF="/rs/scdc/InsertRs_zwdjb.jsp" target="_blank">���ҵ���</A>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <A HREF="/rs/scdc/InsertRs_xxaqcs.jsp" target="_blank">��Ϣ��ȫ����</A>
      </td>
    </tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
String ggbh=null;
String ggmc=null;
String fbsj=null;
String fbr=null;
String dwmc=null;
String fbxx="";

String fgsmc="";
String bmmc="";
String bianhao=null;
String ygbh=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT a.dwmc fgsmc,b.dwmc bmmc,bianhao,ygbh";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
    ls_sql+=" and sq_yhxx.ssfgs=a.dwbh and sq_yhxx.dwbh=b.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsmc=cf.fillHtml(rs.getString("fgsmc"));
		bmmc=cf.fillHtml(rs.getString("bmmc"));
		bianhao=rs.getString("bianhao");
		ygbh=rs.getString("ygbh");
	}
	rs.close();
	ps.close();


	if (ygbh==null)
	{
		ygbh="-1";
	}

	if (bianhao==null)
	{
		bianhao="&nbsp;";
	}
	else {
		bianhao="<img src=\"rs/yghmcgl/images/"+bianhao+".JPG\" height=\"120\">";
	}
%>
	
	<tr> 
      <td height="30" colspan="2">

<%
	//��Ϣ
	fbxx="";
	ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
	ls_sql+=" FROM xz_ggdx,xz_ggbgl,sq_dwxx  ";
	ls_sql+=" where xz_ggdx.ggbh=xz_ggbgl.ggbh and xz_ggbgl.fbbm=sq_dwxx.dwbh and xz_ggdx.yhdlm='"+yhdlm+"' and xz_ggbgl.lrsj>SYSDATE-10";
	ls_sql+=" order by xz_ggbgl.lrsj desc ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ggbh=rs.getString("ggbh");
		ggmc=rs.getString("ggmc");
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		fbr=rs.getString("fbr");
		dwmc=rs.getString("dwmc");

		fbxx+=fbsj+"��<A HREF='#' onclick=window.open('ViewXz_ggbgl.jsp?ggbh="+ggbh+"','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')>"+ggmc+"</A>&nbsp;"+fbr+"��"+dwmc+"��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	rs.close();
	ps.close();

	if (!fbxx.equals(""))
	{
		%> 
        <script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>������Ϣ:<%=fbxx%></font></b></marquee><br>";
			document.write(ie);
		</script>
        <%
	}
%>
 </td>
</tr>

	<tr> 
      <td height="30" colspan="2">

<%
	//������Ϣ
	String xh=null;
	String txlxmc=null;
	String lrr=null;
	String lrsj=null;
	fbxx="";
	ls_sql="SELECT xh,DECODE(txlx,'01','��ѯ�ط�����','02','��ʩ���̻ط�����','03','Ͷ�߱��޻ط�����','04','Ͷ�߱�������') txlxmc,lrr,lrsj";
	ls_sql+=" FROM sq_txxxb ";
    ls_sql+=" where ygbh='"+ygbh+"' and txzt='1' and txfs in('1','9')";//1��δ�鿴��2���鿴;1��ϵͳ��2���绰��3�����棻4�����ţ�9��ȫ��
	ls_sql+=" order by xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=rs.getString("xh");
		txlxmc=rs.getString("txlxmc");
		lrr=rs.getString("lrr");
		lrsj=cf.fillNull(rs.getDate("lrsj"));

		fbxx+=lrsj+"��<A HREF='#' onclick=window.open('ViewTxxxb.jsp?xh="+xh+"','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')>"+txlxmc+"</A>&nbsp;("+lrr+")&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	rs.close();
	ps.close();

	if (!fbxx.equals(""))
	{
		%> 
        <script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>������Ϣ:<%=fbxx%></font></b></marquee><br>";
			document.write(ie);
		</script>
        <%
	}
%>
 </td>
</tr>

	<tr> 
      <td height="30" colspan="2">

<%
	//�ʼ�
	String yjbh=null;
	String yjzt=null;
	String fjr=null;
	String fssj=null;
	String yjlx=null;
	String fjmc=null;
	fbxx="";
	ls_sql="SELECT yjbh,yjzt,sjr,yhmc,fssj,DECODE(yjlx,'J','��������','P','') yjlx,sfyd,fjmc,fjym";
	ls_sql+=" FROM nbyj_sjx,sq_yhxx ";
    ls_sql+=" where nbyj_sjx.fjr=sq_yhxx.ygbh(+) and nbyj_sjx.sjr='"+ygbh+"' and nbyj_sjx.sfyd='N'";
	ls_sql+=" order by nbyj_sjx.fssj ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yjbh=rs.getString("yjbh");
		yjzt=rs.getString("yjzt");
		fjr=rs.getString("yhmc");
		fssj=cf.fillNull(rs.getDate("fssj"));
		yjlx=cf.fillNull(rs.getString("yjlx"));
		fjmc=rs.getString("fjmc");

		fbxx+=fssj+yjlx+"��<A HREF='/nbyj/ViewNbyj_sjx.jsp?yjbh="+yjbh+"' target='_blank'>"+yjzt+"</A>&nbsp;"+fjr+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	rs.close();
	ps.close();

	if (!fbxx.equals(""))
	{
		%> 
        <script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>�ʼ�:<%=fbxx%></font></b></marquee><br>";
			document.write(ie);
		</script>
        <%
	}
%>
 </td>
</tr>


	<tr> 
      <td height="30" colspan="2">

<%
	//���ʦ�ɵ�
	if (zwbm.equals("04") || zwbm.equals("23"))
	{
		String khbh=null;
		String khxm=null;
		String fwdz=null;
		fbxx="";
		ls_sql="SELECT khbh,khxm,fwdz";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where  crm_zxkhxx.sjs='"+yhmc+"' and sfzdzbj='N' and zxzt in('1','5')";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" order by khxm";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			fwdz=rs.getString("fwdz");

			fbxx+="��<A HREF='/dhzx/sjszxone/SjsZxCrm_zxkhxx.jsp?khbh="+khbh+"'>"+khxm+"</A>";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>δ�����ۿͻ�<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

		String yjzxsj=null;
		fbxx="";
		ls_sql="SELECT khbh,khxm,fwdz,yjzxsj";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where  crm_zxkhxx.sjs='"+yhmc+"' and zxzt in('1','5')";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and  yjzxsj-SYSDATE<60 and  yjzxsj>SYSDATE";
		ls_sql+=" order by khxm";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			fwdz=rs.getString("fwdz");
			yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));

			fbxx+="��<A HREF='/dhzx/sjszxone/SjsZxCrm_zxkhxx.jsp?khbh="+khbh+"'>"+khxm+"(Ԥ��װ��ʱ��:"+yjzxsj+")</A>";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>2����װ�޿ͻ�<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

		//Ԥ�����	
		fbxx="";
		ls_sql="SELECT khbh,khxm,fwdz";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where  crm_zxkhxx.sjs='"+yhmc+"' and zxzt in('1','5')";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and ysshbz='M'";//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		ls_sql+=" order by khxm";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			fwdz=rs.getString("fwdz");

			fbxx+="��"+khxm+"(<A HREF='/dhzx/yssh/ViewBj_ysshmx.jsp?khbh="+khbh+"' target='_blank'>�鿴���ϸ���</A>��<A HREF='/dhzx/sjszxone/EditSjsZxCrm_zxkhxx.jsp?khbh="+khbh+"'>�޸ı���</A>)";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>Ԥ�����δͨ��<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}
	
	
	
	}
%>
 </td>
</tr>


	<tr> 
      <td height="30" colspan="2">

<%
	//���ʦ����
	if (zwbm.equals("04") || zwbm.equals("23"))
	{
		String jdjlh=null;
		String khbh=null;
		String khxm=null;
		String hth=null;
		fbxx="";
		ls_sql="SELECT crm_xcjdjl.jdjlh,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth";

		ls_sql+=" FROM crm_khxx,crm_xcjdjl  ";
		ls_sql+=" where crm_xcjdjl.khbh=crm_khxx.khbh";
		ls_sql+=" and ((crm_xcjdjl.clzt='2' and crm_xcjdjl.jdqrjg='N')  ";//2��ȷ��;Y��ͨ����N��δͨ��
		ls_sql+=" OR (crm_xcjdjl.clzt='4' and crm_xcjdjl.tpsftg='N'))  ";//4���������;Y��ͨ����N��δͨ��

		ls_sql+=" and  crm_khxx.sjs='"+yhmc+"'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" order by khxm";

//		out.println(ls_sql);

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			jdjlh=rs.getString("jdjlh");
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			hth=rs.getString("hth");

			fbxx+="��<A HREF='/gcgl/xcjdgl/EditQrSbCrm_xcjdjl.jsp?jdjlh="+jdjlh+"' target='_blank'>"+khxm+"</A>";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>����ȷ��ʧ��<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}
	}
%>
 </td>
</tr>

	<tr> 
      <td height="30" colspan="2">

<%
	//Ͷ�߱���
	String tsjlh=null;
	String khbh=null;
	String khxm=null;
	String hth=null;
	fbxx="";
	ls_sql="SELECT crm_tsbm.tsjlh,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth";

	ls_sql+=" FROM crm_khxx,crm_tsbm  ";
	ls_sql+=" where crm_tsbm.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tsbm.clzt='1'";//1��δ���գ�2���ѳ�������4����������ˣ�3�������ѽ����5���᰸
	ls_sql+=" and crm_tsbm.ygbh='"+ygbh+"'";
	ls_sql+=" order by khxm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		hth=rs.getString("hth");

		fbxx+="��<A HREF='/gcgl/xcjdgl/EditQrSbCrm_xcjdjl.jsp?tsjlh="+tsjlh+"' target='_blank'>"+khxm+"</A>";
	}
	rs.close();
	ps.close();

	if (!fbxx.equals(""))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' class='3dfont' size='5' face='�����п�'>Ͷ�߱���<%=fbxx%></font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
%>
 </td>
</tr>



<%
	//������һ�ڿ�֮��ϵͳ�Զ���������ҵ����֪ͨ
	int yhzbhInt=0;
	ls_sql="SELECT count(*) ";
	ls_sql+=" FROM sq_yhssz";
    ls_sql+=" where yhdlm='"+yhdlm+"' and yhzbh='000013'";//���̲�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhzbhInt=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (yhzbhInt>0)//���̲�
	{
		%>
		<tr> 
		  <td height="30" colspan="2">
		<%
		String jklrsj=null;
		khbh=null;
		khxm=null;
		hth=null;
		fbxx="";

		ls_sql="SELECT cw_khfkjl.lrsj,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth";
		ls_sql+=" FROM crm_khxx,cw_khfkjl  ";
		ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+)";

		ls_sql+=" and cw_khfkjl.fklxbm='11'";//11����װ��
		ls_sql+=" and cw_khfkjl.fkcs='1'";//�տ�����
		ls_sql+=" and cw_khfkjl.scbz='N'";//N��δɾ����Y����ɾ��
		ls_sql+=" and cw_khfkjl.lrsj>SYSDATE-60";

		ls_sql+=" and crm_khxx.gcjdbm='1'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		ls_sql+=" order by cw_khfkjl.lrsj desc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			jklrsj=cf.fillNull(rs.getDate("lrsj"));
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			hth=rs.getString("hth");

			fbxx+="<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>"+khxm+"("+hth+")"+"("+jklrsj+")"+"</A>��";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' >�ѽ�һ�ڿ�δ������<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

		%>
		 </td>
		</tr>
		<%
	}
	//2��3�ν�����Ϣ�ĳ�������ϵͳ����֪ͨ����

	yhzbhInt=0;
	ls_sql="SELECT count(*) ";
	ls_sql+=" FROM sq_yhssz";
    ls_sql+=" where yhdlm='"+yhdlm+"' and yhzbh='000023'";//����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhzbhInt=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (yhzbhInt>0)//����
	{
		%>
		<tr> 
		  <td height="30" colspan="2">
		<%
		String szqsj=null;
		khbh=null;
		khxm=null;
		hth=null;
		fbxx="";

		ls_sql="SELECT crm_khxx.szqsj,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth";
		ls_sql+=" FROM crm_khxx  ";
		ls_sql+=" where crm_khxx.gcjdbm='3'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
		ls_sql+=" and crm_khxx.szqsj>SYSDATE-60";
		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		ls_sql+=" and crm_khxx.jzkfkcs=1";
		ls_sql+=" order by crm_khxx.szqsj desc ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			szqsj=cf.fillNull(rs.getDate("szqsj"));
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			hth=rs.getString("hth");

			fbxx+="<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>"+khxm+"("+hth+")"+"("+szqsj+")"+"</A>��";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' >����������δ�����ڿ<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

		%>
		 </td>
		</tr>
		<%

		%>
		<tr> 
		  <td height="30" colspan="2">
		<%
		String sjjgrq=null;
		khbh=null;
		khxm=null;
		hth=null;
		fbxx="";

		ls_sql="SELECT crm_khxx.sjjgrq,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth";
		ls_sql+=" FROM crm_khxx  ";
		ls_sql+=" where crm_khxx.gcjdbm='4'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
		ls_sql+=" and crm_khxx.sjjgrq>SYSDATE-60";
		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		ls_sql+=" and crm_khxx.jzkfkcs=2";
		ls_sql+=" order by crm_khxx.sjjgrq desc ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
			khbh=rs.getString("khbh");
			khxm=rs.getString("khxm");
			hth=rs.getString("hth");

			fbxx+="<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>"+khxm+"("+hth+")"+"("+sjjgrq+")"+"</A>��";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' >�깤δ��β�<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

		%>
		 </td>
		</tr>
		<%
	}
	//����Ա��Ȩ����
	yhzbhInt=0;
	ls_sql="SELECT count(*) ";
	ls_sql+=" FROM sq_yhssz";
    ls_sql+=" where yhdlm='"+yhdlm+"' and yhzbh='000000'";//����Ա
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhzbhInt=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (yhzbhInt>0)//����Ա
	{
		%>
		<tr> 
		  <td height="30" colspan="2">
		<%
		String rzlrsj=null;
		String rzyhmc=null;
		String rzdwmc=null;
		String rzygbh=null;

		ls_sql="SELECT ygbh,yhmc,dwmc,lrsj";
		ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh(+)  ";
		ls_sql+=" and sq_yhxx.sfzszg in('Y','N')";
		ls_sql+=" and sq_yhxx.lrsj>SYSDATE-60";
		ls_sql+=" and sq_yhxx.yhdlm is null";
		ls_sql+=" order by sq_yhxx.lrsj desc ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			rzlrsj=cf.fillNull(rs.getDate("lrsj"));
			rzygbh=rs.getString("ygbh");
			rzyhmc=rs.getString("yhmc");
			rzdwmc=rs.getString("dwmc");

			fbxx+="<A HREF='/xtsq/yhxx/EditSq_yhxx.jsp?ygbh="+rzygbh+"' target='_blank'>"+rzyhmc+"("+rzdwmc+")"+"("+rzlrsj+")"+"</A>��";
		}
		rs.close();
		ps.close();

		if (!fbxx.equals(""))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=40 ><b><font color='#FF0000' >����ְ����Ȩ��<%=fbxx%></font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

		%>
		 </td>
		</tr>
		<%
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
    <tr> 
      <td width="53%" >&nbsp;</td>
      <td width="47%" ><font color="#000000"><a href="Xz_OldggbglCxList.jsp">�鿴ȫ��������Ϣ</a></font></td>
    </tr>
  </table>

 </div>
 <BR>  
<div align="right">

  <table width="100%" border="0">
    <tr> 
      <td width="73%" rowspan="3">
        <font face="��������">��ҵ��λ:����Ʒ��ר������<br>
��ҵԸ��:����װ��װ����ҵ�·���<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
��ҵ����:����.����.����.����<br>
������ּ:������ר.����ϸ  ҵ������.����ֿ<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
��������:һ��ѡ��.�����غ�      </font></td>
      <td rowspan="3" width="4%" align="center">&nbsp;</td>
      <td width="23%"><b><%=fgsmc%></b></td>
    </tr>
    <tr> 
      <td width="23%"><b><%=bmmc%></b></td>
    </tr>
    <tr> 
      <td width="23%"><b><%=yhmc%></b></td>
    </tr>
  </table>
</div>


</body> 
</html>

<SCRIPT language=javascript >
<!--
//	window.open("http://192.168.1.177:8090/set.jsp?yhdlm=<%=yhdlm%>", "_blank", "fullscreen=3,titlebar=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,edge:Raised,left=1000,top=1000,width=1,height=1,false");
//-->
</SCRIPT>