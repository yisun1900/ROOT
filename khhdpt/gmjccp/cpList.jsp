<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
	<title>����չ��</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<STYLE>
	B {font-size: 9pt;} 
	A:link,A:visited ,A:active {TEXT-DECORATION: none}
	A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
</style>
<script language="Javascript" type="text/Javascript">
<!--
	function gopage(gop)    //v3.0   ***���ڶ���ҳ��ѡ��ҳ����ת
	{ 
		var px="&pxfs=";
		var pageID=form1.gop.value+px+form1.pxfs.value;
		var url=pageID;
		window.location.href = url;
	}
</script>
<script language="Javascript" type="text/Javascript">
	<!--
	function gopage2(gop)    //v3.0   ***����ҳ�ײ���ѡ��ҳ����ת
	{ 
		form1.gop.value=form1.gop2.value;
		var px="&pxfs=";
		var pageID=form1.gop.value+px+form1.pxfs.value;
		var url=pageID;
		window.location.href = url;
	}
</script>
<script language="Javascript" type="text/Javascript">
	<!--
	function xzpxfs(gop)  //v3.0   ***���ڶ�������ʽҳ����ת
	{ 
		var px="&pxfs=";
		var pageID=form1.gop.value+px+form1.pxfs.value;
		var url=pageID;
		window.location.href = url;
	}
</script>
<script language="Javascript" type="text/Javascript">
	<!--
	function xzpxfs2(gop)  //v3.0   ***���ڵײ�����ʽҳ����ת
	{ 
		form1.pxfs.value=form1.pxfs2.value;
		var px="&pxfs=";
		var pageID=form1.gop.value+px+form1.pxfs.value;
		var url=pageID;
		window.location.href = url;
	}
</script>
<script language=javaScript>
	function winOpen(Url,width,height,scrollbar,resize)//ʹ�����Ĵ��ھ���
	{
		ow = width;
		oh = height;
		os = scrollbar;
		or = resize;
		var xposition=0; 
		var yposition=0;
		if ((parseInt(navigator.appVersion) >= 4 ))
		{
			xposition = (screen.width - width) / 2;
			yposition = (screen.height - height-25) / 2;
		}
		window.open (Url,"","width ="+ow+",height="+oh+",scrollbars = "+os+",resizable="+or+",left="+xposition+",top="+yposition );
	} 
</script>
<%
String cldlbm=request.getParameter("cldlbm");
String ppmc=request.getParameter("ppmc");
String getcllbbm=request.getParameter("cllbbm");




String yhbh=(String)session.getAttribute("khbh");//�û����
String lrr=(String)session.getAttribute("yhdlm");//�û���¼ʱ������
String ls_sql="";
String wheresql="";
String ordersql="";
int orders = 0;
String wheretj=(String)session.getAttribute("wheretj");
String curpage=request.getParameter("curpage");//��ǰҳ
String gopage=request.getParameter("gopage");//��һ��
String cururl="";


String ssfgs=request.getParameter("ssfgs");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");


int ordsqlid; //����ID
try //��ȡ����ID
{
	ordsqlid=Integer.parseInt(request.getParameter("pxfs")); 
}
catch(Exception e)
{ 
	ordsqlid = 0; 
}
String order[] = {" order by xsj "," order by xsj desc "," order by sfycx desc "," order by sfyh desc "};//����ʽ��
ordersql = order[ordsqlid];//����ʽSQL
String clbm=null;
String clmc=null;
String cllbbm=null;
String zcdlmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbm=null;
String lsj=null;
String xsj=null;
String dwmc=null;
String bz=null;
String zp=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sfyh=null;
ls_sql="SELECT jxc_clbm.clbm,clmc,cllbbm,xh,gg,clysbm,jldwbm,lsj,xsj,zp,jxc_clbm.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','�л�','N','<font color=\"#FF0000\">�޻�</font>') sfyh ";
ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm  ";
if (curpage!=null)
{
	wheresql=wheretj;
}
else
{
	wheresql=" and jxc_clbm.ppmc='"+ppmc+"' and jxc_clbm.cldlbm='"+cldlbm+"' and jxc_clbm.cllbbm='"+getcllbbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
	session.setAttribute("wheretj",wheresql);//����session����
}
int rows=0;


int cur=0;
int pripage=0;
int nextpage=0;
boolean pri=false;
boolean next=false;
int endrow=0; //������¼���һҳ������ ���Ϊ���� ��ӱ�� ������ֻҿ�
int start=0;
int end=0;
int row=0;
int outtr=0;

if (curpage==null || curpage.equals(""))//ȡ��ѡ���ҳ�� ������ת
{
	cur=1;
	curpage="1";
}
else
{
	cur=Integer.parseInt(curpage);
}
//��¼��

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String rowsql="";
try
{
	conn=cf.getConnection();    //�õ�����

//	wheresql=" and jxc_clbm.ppmc='"+ppmc+"' and jxc_clbm.cldlbm='"+cldlbm+"' and jxc_clbm.cllbbm='"+getcllbbm+"' and jxc_clbm.dqbm='"+dqbm+"'";

	rowsql = " select count(*)";
	rowsql+=" FROM jxc_clbm,jxc_cljgb  ";
	rowsql+=" where jxc_clbm.clbm=jxc_cljgb.clbm  ";
	rowsql += wheresql;
	ps= conn.prepareStatement(rowsql);
	rs=ps.executeQuery();
	if (rs.next())                            
	{
		row=rs.getInt(1);
	}
	rs.close();
	ps.close();
}
catch (Exception e) 
{
	out.print("Exception: " + e);
			out.print("<BR>SQL=" + rowsql);
	return;
}
finally 
{
	try
	{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e)
	{
		if (conn != null) cf.close(conn); 
	}
}
double pagesl=row*1.0/6;//ҳ����
int pageslint = (int)pagesl;
if (pagesl>pageslint){pageslint=pageslint+1;}
if (pagesl>cur)
{
	next=true;
	nextpage=cur+1;
}
if (cur>1)
{
	pri=true;
	pripage=cur-1;
}
start=(cur-1)*6+1;//��ҳ��һ����¼
outtr=start-1;
//	out.println("row="+row);
//	out.println("pagesl="+pagesl);
//	out.println("cur="+cur);
//	out.println("nextpage="+nextpage);
//	out.println("pripage="+pripage);
%>
<body bgcolor="#FFFFFF">
<table height="100%" width="100%" border="0" align="center">
	<tr> 
	<td valign="top"> 
	<form name="form1"  method="post" action="">
	<table width="100%" border="0">
		<tr> 
			<td bgcolor="#EEEEEE">
				<div align="left">
					<font size="-1"><B>����λ�� <img src=../images/ann.gif> <a href="GmjccpIndex.jsp"><%=cldlbm%></a> <img src=../images/ann.gif> <a href="zcxlbmList.jsp?ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>">a</a> <img src=../images/ann.gif> <a href="ppmcList.jsp?ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>"><%=ppmc%></a> <img src=../images/ann.gif> <a href="XhList.jsp?ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>"><%=getcllbbm%></a> <img src=../images/ann.gif> ��Ʒ��Ϣ</B><font>
				</div>
			</td>
		</tr>
		<tr> 
			<td>
				<font size="-1"> 
				<%out.print("<b><font color='blue'>||</font> <font color='red'>"+curpage+"</font>/"+pageslint+" <font color='blue'>||</font> ����"+row+" <font color='blue'>||</font></b> ");%>
				<%if (pri){%>
				<a href ="cpList.jsp?curpage=<%=pripage%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>&pxfs=<%=ordsqlid%>"><b>��һҳ</a>
				<font color="blue">||</font>  </b>
				<%}
				else {out.print("<b>��һҳ <font color='blue'>||</font></b>");}
				if (next){%>
				<a href ="cpList.jsp?curpage=<%=nextpage%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>&pxfs=<%=ordsqlid%>"> 
				<b> ��һҳ</a> <font color="blue">||</font> </b>
				<%} else {out.print("<b> ��һҳ <font color='blue'>|| </font></b>");}%>
				<b><A href="mycart.jsp" target="_back">�ҵĹ��ﳵ</A> <font color="blue">||</font> 
				<A href="printmycart.jsp" target="_back">��ӡ������</A> <font color="blue">||</font>
				<A href="mycartend.jsp"  onclick="return confirm('��������ǰ�����ȴ�ӡ��񣬵��ȡ�����أ�')" target="_back">��������</A> <font color="blue">|| </font><A href="allmycart.jsp" target="_bacl">�ҵĹ���ʷ</A>  <font color="blue">|| </font>
				<font color="red"> GO </font> <select name="gop" onChange="gopage(this)"> </b>
					<%
					for (int i=1;i<=pageslint;i++)
					{
						if (i==cur)
						{%>
							<option value="cpList.jsp?curpage=<%=i%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>" selected><%=i%></option>
						<%} 
						else 
						{%>
							<option value="cpList.jsp?curpage=<%=i%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>"><%=i%></option>
						<%}
					}%>
				</select>  
				<b>����</B> <select name="pxfs" onChange="xzpxfs(this)">
					<option value="0" <%if (ordsqlid==0) out.print("selected");%>>�۸�����</option>
					<option value="1" <%if (ordsqlid==1) out.print("selected");%>>�۸���</option>
					<option value="2" <%if (ordsqlid==2) out.print("selected");%>>�Ƿ����</option>
					<option value="3" <%if (ordsqlid==3) out.print("selected");%>>�Ƿ��л�</option>
				</select>
				</font>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="1">
		<%
		try //��ѯ���
		{
			conn=cf.getConnection();

			String sqllist=ls_sql+wheresql+ordersql;
			ps= conn.prepareStatement(sqllist);
			rs =ps.executeQuery(sqllist);
	//		out.print(sqllist);
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));
				clmc=cf.fillHtml(rs.getString("clmc"));
				cllbbm=cf.fillNull(rs.getString("cllbbm"));
				xh=cf.fillNull(rs.getString("xh"));
				gg=cf.fillNull(rs.getString("gg"));
				clysbm=cf.fillNull(rs.getString("clysbm"));
				jldwbm=cf.fillNull(rs.getString("jldwbm"));
				lsj=cf.fillNull(rs.getString("lsj"));
				xsj=cf.fillNull(rs.getString("xsj"));
				bz=cf.fillNull(rs.getString("bz"));
				zp=cf.fillNull(rs.getString("zp"));
				sfycx=cf.fillNull(rs.getString("sfycx"));
				cxj=cf.fillNull(rs.getString("cxj"));
				cxkssj=cf.fillNull(rs.getDate("cxkssj"));
				cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
				sfyh=cf.fillNull(rs.getString("sfyh"));

				if (rows==outtr)
				{
					out.println("<tr>");
				}
				else if (rows>outtr && rows%2==0)
				{
					out.println("</tr>");
					out.println("<tr>");
				}
				rows++;

				start--;
				if (start>0)
				{
					continue;
				}

				end++;

				if (end>6)
				{
					break;
				}
				endrow++;
				%>
				<td  bgcolor="#FFFFFF" align="center" valign="top" width="20%"> 
					<A HREF=# onClick="winOpen('maxphoto.jsp?clbm=<%=clbm%>','900','600','_back','yes')" onFocus=this.blur()><IMG SRC="/jxc\zcdxpwh\images/images/<%=zp%>"  onerror="this.src='../images/error.jpg'" border=0 width="150" title="�������ͼ."></A><BR> 
					&nbsp;<BR> <A href=# onClick="winOpen('Insertdgcp.jsp?clbm=<%=clbm%>','450','200','_back','yes')" ;><img src="../images/add_to_cart4.gif" border=0></A> 
				</td>
				<td  bgcolor="#FFFFFF" width="30%">
					<div align="left"> <font color="#0000CC">���ı���</font>��<%=clbm%> 
						<br>
						<font color="#0000CC">��������</font>��<%=clmc%><br>
						<font color="#0000CC">���ϵ��</font>��<%=cllbbm%> <br>
						<font color="#0000CC">��&nbsp;&nbsp;&nbsp;&nbsp;��</font>��<%=xh%><br>
						<font color="#0000CC">��&nbsp;&nbsp;&nbsp;&nbsp;��</font>��<%=gg%><br>
						<font color="#0000CC">��&nbsp;&nbsp;&nbsp;&nbsp;ɫ</font>��<%=clysbm%><br>
						<font color="#0000CC">�г����</font>����<%=lsj%> /<%=jldwbm%><br>
						<font color="#0000CC">�����޼�</font>����<%=xsj%> /<%=jldwbm%><br>
						<%
						if (sfycx.equals("Y"))
						{
						%>
						<font color="#0000CC">�� �� ��</font>��<font color="#FF0000">��<%=cxj%></font><br>
						<font color="#0000CC">��ʼʱ��</font>��<font color="#FF0000"><%=cxkssj%></font><br>
						<font color="#0000CC">����ʱ��</font>��<font color="#FF0000"><%=cxjzsj%></font><br>
						<%
						}
						else{
						%>
						<font color="#0000CC">�� �� ��</font>����<br>
						<%
						}
						%>
						<font color="#0000CC">�Ƿ��л�</font>��<%=sfyh%><br>
						<font color="#0000CC">չ��λ��</font>��XXչ��XX����<br>
						<font color="#0000CC">��&nbsp;&nbsp;&nbsp;&nbsp;ע</font>��<%=bz%> <br>
					</div>
				</td>
				<%
			}
			rs.close();
			ps.close();
			if (endrow%2!=0){out.print("<td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>&nbsp;</td>");}
		}
		catch (Exception e) 
		{
			out.print("Exception: " + e);
			out.print("<BR>SQL=" + ls_sql);
			return;
		}
		finally 
		{
			try
			{
				if (rs != null) rs.close(); 
				if (ps != null) ps.close(); 
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e)
			{
				if (conn != null) cf.close(conn); 
			}
		}
		%>
		</tr>
	</table>
	</td>
	</tr>
	<table width="100%" border="0">
		<tr> 
			<td valign="top" height="30"><font size="-1"> 
				<%out.print("<b><font color='blue'>||</font> <font color='red'>"+curpage+"</font>/"+pageslint+""+" <font color='blue'>||</font> ����"+row+" <font color='blue'>||</font> </b>");%>
				<%if (pri){%>
				<a href ="cpList.jsp?curpage=<%=pripage%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>&pxfs=<%=ordsqlid%>"><b>��һҳ</a> 
				<font color="blue">||</font> </b> 
				<%}
				else {out.print("<b>��һҳ <font color='blue'>||</font></b>");}
				if (next){%>
				<a href ="cpList.jsp?curpage=<%=nextpage%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>&pxfs=<%=ordsqlid%>"> <b> 
				��һҳ</a> <font color="blue">||</font> </b> 
				<%} else {out.print("<b> ��һҳ <font color='blue'>|| </font></b>");}%>
				<A href="mycart.jsp" target="_back"><b>�ҵĹ��ﳵ</A> <font color="blue">||</font> 
				<A href="printmycart.jsp" target="_back">��ӡ������</A> 
				<font color="blue">||</font> <A href="mycartend.jsp"  onclick="return confirm('��������ǰ�����ȴ�ӡ��񣬵��ȡ�����أ�')" target="_back">��������</A> 
				<font color="blue">||</font> <A href="allmycart.jsp" target="_bacl">�ҵĹ���ʷ</A> <font color="blue">||</font>  
				<font color="red">GO</font> </b> 
				<select name="gop2" onChange="gopage2(this)"> 
				<%
				for (int i=1;i<=pageslint;i++)
				{
				if (i==cur)
				{%>
				<option value="cpList.jsp?curpage=<%=i%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>" selected><%=i%>
				</option>
				<%} 
				else {%>
				<option value="cpList.jsp?curpage=<%=i%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(getcllbbm,"UTF-8")%>"><%=i%>
				</option>
				<%}
				} %>
				</select>  
				<B>����</B><select name="pxfs2" onChange="xzpxfs2(this)">
					<option value="0" <%if (ordsqlid==0) out.print("selected");%>>�۸�����</option>
					<option value="1" <%if (ordsqlid==1) out.print("selected");%>>�۸���</option>
					<option value="2" <%if (ordsqlid==2) out.print("selected");%>>�Ƿ����</option>
					<option value="3" <%if (ordsqlid==3) out.print("selected");%>>�Ƿ��л�</option>
				</select>
			</td>
		</tr>
	</table>
</table>
</form>
</body>
</html>