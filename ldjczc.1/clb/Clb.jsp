<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170802'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���ϲ�����]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[���ϲ�����]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String clgw=cf.GB2Uni(request.getParameter("clgw"));

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ




String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #CC3366; font-weight: bold; }
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���ϲ�����<BR>
  (ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="5%" >���</td>
  <td  width="20%" >����</td>
  <td  width="15%" >����Ա</td>

  <td  width="10%" >��������</td>
  <td  width="10%" >ǩԼ��</td>
  <td  width="10%" >��ʩ��������</td>
  <td  width="10%" >ǩԼδ��������</td>
  <td  width="10%" >�ܹ�������</td>
  <td  width="10%" >����Ͷ������</td>
  </tr>
<%
	int zjlfdjkhs=0;
	int zjhddjkhs=0;
	int zjsjfkhs=0;
	int zjzsgds=0;
	int zjwkggds=0;
	int zjzctssl=0;
	int zjqys=0;

	int row=0;

	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT sq_dwxx.ssfgs,b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	if (!(clgw.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where ssfgs='"+fgs+"' and yhmc='"+clgw+"' and zwbm in('08'))";
	}

	ls_sql+=" and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("ssfgs");
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");
		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));

		int xjlfdjkhs=0;
		int xjhddjkhs=0;
		int xjsjfkhs=0;
		int xjzsgds=0;
		int xjwkggds=0;
		int xjzctssl=0;
		int xjqys=0;

		String getclgw="";
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT yhmc,sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('08')";//08:�Ҿӹ���
		ls_sql+=" and dwbh='"+getdwbh+"'";
		if (!(clgw.equals("")))
		{
			ls_sql+=" and yhmc='"+clgw+"'";
		}
		ls_sql+=" and sfzszg in('Y','N')";
		ls_sql+=" order by yhmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getclgw=rs1.getString("yhmc");
			sfzszg=rs1.getString("sfzszg");
			rzsj=cf.fillNull(rs1.getDate("rzsj"));
			lzrq=cf.fillNull(rs1.getDate("lzrq"));

			int lfdjkhs=0;//��װ����ͻ���
			ls_sql="SELECT count(crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and  crm_zxkhxx.clgw='"+getclgw+"'";
			ls_sql+=" and crm_zxkhxx.lfdjbz='Y'";//N��δ������Y���ѽ�����T���˶���
			ls_sql+=" and  crm_zxkhxx.lfdj>0";
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				lfdjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			xjlfdjkhs+=lfdjkhs;
			zjlfdjkhs+=lfdjkhs;


			int hddjkhs=0;//�ײͶ���ͻ���
			ls_sql="SELECT count(crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and  crm_zxkhxx.clgw='"+getclgw+"'";
			ls_sql+=" and crm_zxkhxx.hddjbz='Y'";//N��δ������Y���ѽ�����T���˶���
			ls_sql+=" and  crm_zxkhxx.hddj>0";
			ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				hddjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			xjhddjkhs+=hddjkhs;
			zjhddjkhs+=hddjkhs;

			int sjfkhs=0;//��Ʒѿͻ���
			ls_sql="SELECT count(crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and crm_zxkhxx.clgw='"+getclgw+"'";
			ls_sql+=" and crm_zxkhxx.sjfbz='Y'";//N��δ����Ʒѣ�Y���ѽ���Ʒѣ�T������Ʒ�
			ls_sql+=" and crm_zxkhxx.sjf>0";
			ls_sql+=" and crm_zxkhxx.jsjfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jsjfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				sjfkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			xjsjfkhs+=sjfkhs;
			zjsjfkhs+=sjfkhs;

			//ǩԼ��
			int qys=0;
			ls_sql =" SELECT count(*) qys";
			ls_sql+=" FROM crm_khxx ";
			ls_sql+=" where dwbh='"+getdwbh+"' and clgw='"+getclgw+"'";
			ls_sql+=" and zt='2'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				qys=rs2.getInt("qys");
			}
			rs2.close();
			ps2.close();

			xjqys+=qys;
			zjqys+=qys;

			//��ʩ��������
			int zsgds=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_khxx ";
			ls_sql+=" where dwbh='"+getdwbh+"' and clgw='"+getclgw+"'";
			ls_sql+=" and zt='2'";
			ls_sql+=" and gcjdbm in('2','3','6')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zsgds=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			xjzsgds+=zsgds;
			zjzsgds+=zsgds;

			//ǩԼδ��������
			int wkggds=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_khxx ";
			ls_sql+=" where dwbh='"+getdwbh+"' and clgw='"+getclgw+"'";
			ls_sql+=" and zt='2'";
			ls_sql+=" and gcjdbm in('1')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				wkggds=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			xjwkggds+=wkggds;
			zjwkggds+=wkggds;
	

			//����Ͷ������
			int zctssl=0;
			ls_sql =" SELECT count(distinct crm_tsjl.tsjlh)";
			ls_sql+=" FROM crm_khxx,crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_khxx.khbh=crm_tsjl.khbh ";
			ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and crm_khxx.clgw='"+getclgw+"'";
			ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
			ls_sql+=" and crm_tsjl.tsbxsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.tsbxsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_tsbm.tslxbm='23'";//23:�Ҿ�Ͷ��
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zctssl=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			xjzctssl+=zctssl;
			zjzctssl+=zctssl;

			row++;

			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td align="center"><%=row%></td>
				<td align="center"><%=dmmc%></td>
				<td align="center"><%=getclgw%></td>

				<td>
					<A HREF="ViewClyDjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=(lfdjkhs+hddjkhs+sjfkhs)%></A>				</td>
				<td>
					<A HREF="ViewClyQyMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=qys%></A>				</td>
				<td>
					<A HREF="ViewClyZsMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble(zsgds)%></A></td>
				<td>
					<A HREF="ViewClyWkgMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=wkggds%></A>				</td>
				<td><%=cf.formatDouble(wkggds+zsgds)%></td>
				<td>
					<A HREF="ViewClyTsMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=zctssl%></A>				</td>
			</tr>
			<%	
		}
		rs1.close();
		ps1.close();

		%>
		<tr align="center"  bgcolor="#E8E8FF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="3" align="center"><span class="STYLE3">[<%=dmmc%>]С��</span></td>

			<td>
				<B><%=(xjlfdjkhs+xjhddjkhs+xjsjfkhs)%>			    </B></td>
			<td><B><%=xjqys%></B></td>
			<td><B><%=xjzsgds%></B></td>
			<td><B><%=xjwkggds%></B></td>
			<td><B><%=xjwkggds+xjzsgds%></B></td>
			<td><B><%=xjzctssl%></B></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();



%>
<tr align="center"  bgcolor="#E8E8FF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3" align="center"><span class="STYLE3">��  ��</span></td>

	<td>
		<B><%=(zjlfdjkhs+zjhddjkhs+zjsjfkhs)%>			    </B></td>
	<td><B><%=zjqys%></B></td>
	<td><B><%=zjzsgds%></B></td>
	<td><B><%=zjwkggds%></B></td>
	<td><B><%=zjwkggds+zjzsgds%></B></td>
	<td><B><%=zjzctssl%></B></td>
</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 

<script  LANGUAGE="javascript">
<!--

function f_dqmx(formName)
{
	formName.action="ViewAllClgwYjMx.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
	formName.submit();
	return true;
} 

function f_exp(formName)
{
	formName.action="ViewAllClgwYjMxExec.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
	formName.submit();
	return true;
} 
//-->
</script>

