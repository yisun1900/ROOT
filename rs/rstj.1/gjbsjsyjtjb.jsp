<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

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
//String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	wheresql1+=" where ssdqbm=(select ssdqbm from sq_dwxx where dwbh='"+fgs+"')";
}



wheresql2+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql2+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
PreparedStatement ps2=null;//ty
ResultSet rs2=null;//ty
PreparedStatement ps3=null;//ty
ResultSet rs3=null;//ty

int i=0;

String ssdqmc=null;//大区
String ssdqbm=null;
String fgsmc=null;//分公司名称
String fgsbh=null;

int fgscz=0;//分公司产值
int fgsssjf=0;//分公司收设计费
int sjss=0;//设计师数
int sjsjb=0;//设计师级别编号
String sjsjbmc=null;//设计师级别名称
int jbsjss=0;//级别划分后的设计师数
int jbfgscz=0;//级别划分后的产值
int jbfgsssjf=0;//级别划分后的设计费
double jbsjsszb=0;//级别划分后的设计师数占比
double jbfgsczzb=0;//级别划分后的产值占比
double jbfgsssjfzb=0;//级别划分后的设计费占比

int fgsczxj=0;//分公司产值小计
int fgsssjfxj=0;//分公司收设计费小计
int sjssxj=0;//设计师数小计
int jbsjssxj[]={0,0,0,0,0};//级别划分后的设计师数小计，索引从1到4，分别存四个级别的
int jbfgsczxj[]={0,0,0,0,0};//级别划分后的产值小计，索引从1到4，分别存四个级别的
int jbfgsssjfxj[]={0,0,0,0,0};//级别划分后的设计费小计，索引从1到4，分别存四个级别的
double jbsjssxjzb=0;//级别划分后的设计师数小计占比
double jbfgsczxjzb=0;//级别划分后的产值小计占比
double jbfgsssjfxjzb=0;//级别划分后的设计费小计占比

int fgsczzj=0;//分公司产值总计
int fgsssjfzj=0;//分公司收设计费总计
int sjsszj=0;//设计师数总计
int jbsjsszj[]={0,0,0,0,0};//级别划分后的设计师数总计，索引从1到4，分别存四个级别的
int jbfgsczzj[]={0,0,0,0,0};//级别划分后的产值总计，索引从1到4，分别存四个级别的
int jbfgsssjfzj[]={0,0,0,0,0};//级别划分后的设计费总计，索引从1到4，分别存四个级别的
double jbsjsszjzb=0;//级别划分后的设计师数总计占比
double jbfgsczzjzb=0;//级别划分后的产值总计占比
double jbfgsssjfzjzb=0;//级别划分后的设计费总计占比

try {
	conn=cf.getConnection();
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>各级别设计师业绩统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<table border="1" width="350%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="4%" rowspan="3">大区</td>
  <td  width="4%" rowspan="3">分公司</td>
  <td  width="5%" rowspan="3">分公司产值</td>
  <td  width="4%" rowspan="3">分公司收设计费</td>
  <td  width="3%" rowspan="3">设计师总数</td>
  <td  width="80%" colspan="24">设计师级别</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center" >
<%
	ls_sql="SELECT sjsjb,sjsjbmc";
	ls_sql+=" FROM rs_sjsjb";
	ls_sql+=" order by sjsjb";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		sjsjb=rs.getInt(1);
		sjsjbmc=rs.getString(2);
		i++;
	%>
  <td colspan="6"><%=sjsjbmc%></td>
  <%
	}
	rs.close();
	ps.close();

	%>
</tr>
<tr bgcolor="#CCCCCC"  align="center" >
<%
	for(;i>0;i--)
	{
		%>
  <td style="word-break:break-all">人数</td>
  <td style="word-break:break-all">人数<br>占比</td>
  <td style="word-break:break-all">产值</td>
  <td style="word-break:break-all">产值<br>占比</td>
  <td style="word-break:break-all">设计费</td>
  <td style="word-break:break-all">设计费<br>占比</td>
 
<%
	}
	%>
</tr>
<%
	ls_sql=" SELECT ssdqbm,ssdqmc ";
	ls_sql+=" FROM sq_ssdqbm";
	ls_sql+=wheresql1;
	ls_sql+=" order by ssdqbm";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{		
		ssdqbm=rs.getString("ssdqbm");
		ssdqmc=rs.getString("ssdqmc");
		//分公司
		
		ls_sql="SELECT dwbh,dwmc ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where  dwlx='F0' and ssdqbm='"+ssdqbm+"' and cxbz='N'";
		ls_sql+=wheresql;
		ls_sql+=" order by dwbh";
		ps1=conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
	
		while (rs1.next())
		{
			fgsbh=rs1.getString("dwbh");
			fgsmc=rs1.getString("dwmc");

			ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
			ls_sql+=" FROM cw_qmjzmx";
			ls_sql+=" where cw_qmjzmx.fgsbh='"+fgsbh+"'";
			ls_sql+=" and cw_qmjzmx.zt!=3";
			ls_sql+=wheresql2;
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				fgscz=rs2.getInt(1);
				fgsssjf=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();

			ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
			ls_sql+=" FROM cw_qmjzmx";
			ls_sql+=" where cw_qmjzmx.fgsbh='"+fgsbh+"'";
			ls_sql+=" and cw_qmjzmx.zt=3";
			ls_sql+=wheresql2;
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				fgscz-=rs2.getInt(1);
				fgsssjf-=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();
			
			fgsczxj+=fgscz;
			fgsssjfxj+=fgsssjf;

			ls_sql="SELECT count(*)";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and zwbm='04' and ssfgs='"+fgsbh+"'";//04：设计师
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				sjss=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			sjssxj+=sjss;
			%>
					</tr>
			<tr align="center" bgcolor="#FFFFFF">
				<td ><%=ssdqmc%></td>
				<td ><%=fgsmc%></td>
				<td ><%=fgscz%></td>
				<td ><%=fgsssjf%></td>
				<td ><%=sjss%></td>
		<%
			
			ls_sql="SELECT sjsjb,sjsjbmc";
			ls_sql+=" FROM rs_sjsjb";
			ls_sql+=" order by sjsjb";
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			while (rs2.next())
			{
				sjsjb=rs2.getInt(1);
				sjsjbmc=rs2.getString(2);

				ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
				ls_sql+=" FROM sq_yhxx,cw_qmjzmx";
				ls_sql+=" where sq_yhxx.sjsjb='"+sjsjb+"' and cw_qmjzmx.fgsbh='"+fgsbh+"'";
				ls_sql+=" and cw_qmjzmx.dwbh=sq_yhxx.dwbh";
				ls_sql+=" and cw_qmjzmx.sjs=sq_yhxx.yhmc";
				ls_sql+=" and cw_qmjzmx.zt!=3";
				ls_sql+=wheresql2;
				ps3=conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if (rs3.next())
				{
					jbfgscz=rs3.getInt(1);
					jbfgsssjf=rs3.getInt(2);
				}
				rs3.close();
				ps3.close();
				
				ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
				ls_sql+=" FROM sq_yhxx,cw_qmjzmx";
				ls_sql+=" where sq_yhxx.sjsjb='"+sjsjb+"' and cw_qmjzmx.fgsbh='"+fgsbh+"'";
				ls_sql+=" and cw_qmjzmx.dwbh=sq_yhxx.dwbh";
				ls_sql+=" and cw_qmjzmx.sjs=sq_yhxx.yhmc";
				ls_sql+=" and cw_qmjzmx.zt=3";
				ls_sql+=wheresql2;
				ps3=conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if (rs3.next())
				{
					jbfgscz-=rs3.getInt(1);
					jbfgsssjf-=rs3.getInt(2);
				}
				rs3.close();
				ps3.close();

				jbfgsczxj[i]+=jbfgscz;
				jbfgsssjfxj[i]+=jbfgsssjf;

				ls_sql="SELECT count(*)";
				ls_sql+=" FROM sq_yhxx";
				ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and sjsjb='"+sjsjb+"' and zwbm='04' and ssfgs='"+fgsbh+"'";//04：设计师
				ps3=conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if(rs3.next())
				{
					jbsjss=rs3.getInt(1);
				}
				rs3.close();
				ps3.close();

				jbsjssxj[i]+=jbsjss;
				i++;

				if(sjss==0)
				jbsjsszb=0;
				else
				jbsjsszb=jbsjss*100.0/sjss;
				if(fgscz==0)
				jbfgsczzb=0;
				else
				jbfgsczzb=jbfgscz*100.0/fgscz;
				if(fgsssjf==0)
				jbfgsssjfzb=0;
				else
				jbfgsssjfzb=jbfgsssjf*100.0/fgsssjf;

	%>
				<td ><%=jbsjss%></td>
				<td ><%=cf.round(jbsjsszb,1)%>%</td>
				<td ><%=jbfgscz%></td>
				<td ><%=cf.round(jbfgsczzb,1)%>%</td>
				<td ><%=jbfgsssjf%></td>
				<td ><%=cf.round(jbfgsssjfzb,1)%>%</td>
			   
	<%
				
				
			}
			i=1;
%>
		</tr>
	<%
		}
			rs1.close();
			ps1.close();
			%>
			<tr align="center" bgcolor="#E8E8FF"> 
			  <td colspan="2" ><B>『<%=ssdqmc%>』合计</B></td>	
			  <td ><%=fgsczxj%></td>
			  <td ><%=fgsssjfxj%></td>
			  <td ><%=sjssxj%></td>
			<%

			for(i=1;i<5;i++)
			{
				if(sjssxj==0)
				jbsjssxjzb=0;
				else
				jbsjssxjzb=jbsjssxj[i]*100.0/sjssxj;
				if(fgsczxj==0)
				jbfgsczxjzb=0;
				else
				jbfgsczxjzb=jbfgsczxj[i]*100.0/fgsczxj;
				if(fgsssjfxj==0)
				jbfgsssjfxjzb=0;
				else
				jbfgsssjfxjzb=jbfgsssjfxj[i]*100.0/fgsssjfxj;	

			%>
			  <td ><%=jbsjssxj[i]%></td>
			  <td ><%=cf.round(jbsjssxjzb,1)%>%</td>
			  <td ><%=jbfgsczxj[i]%></td>
			  <td ><%=cf.round(jbfgsczxjzb,1)%>%</td>
			  <td ><%=jbfgsssjfxj[i]%></td>
			  <td ><%=cf.round(jbfgsssjfxjzb,1)%>%</td>
			<%
			}
			fgsczzj+=fgsczxj;
			fgsssjfzj+=fgsssjfxj;
			sjsszj+=sjssxj;
			
			fgsczxj=0;//分公司产值小计
			fgsssjfxj=0;//分公司收设计费小计
			sjssxj=0;//设计师数小计
			for(i=1;i<5;i++)
			{
				jbsjsszj[i]+=jbsjssxj[i];
				jbfgsczzj[i]+=jbfgsczxj[i];
				jbfgsssjfzj[i]+=jbfgsssjfxj[i];
				jbsjssxj[i]=0;
				jbfgsczxj[i]=0;
				jbfgsssjfxj[i]=0;	
			}
			i=1;
			jbsjssxjzb=0;//级别划分后的设计师数小计占比
			jbfgsczxjzb=0;//级别划分后的产值小计占比
			jbfgsssjfxjzb=0;//级别划分后的设计费小计占比
			%>
			</tr>
			<%
				
			
		 
	}
	rs.close();
	ps.close();
%>
			<tr align="center" bgcolor="#E8E8FF"> 
			  <td colspan="2" ><B>总计</B></td>	
			  <td ><%=fgsczzj%></td>
			  <td ><%=fgsssjfzj%></td>
			  <td ><%=sjsszj%></td>
			<%

			for(i=1;i<5;i++)
			{
				if(sjsszj==0)
				jbsjsszjzb=0;
				else
				jbsjsszjzb=jbsjsszj[i]*100.0/sjsszj;
				if(fgsczzj==0)
				jbfgsczzjzb=0;
				else
				jbfgsczzjzb=jbfgsczzj[i]*100.0/fgsczzj;
				if(fgsssjfzj==0)
				jbfgsssjfzjzb=0;
				else
				jbfgsssjfzjzb=jbfgsssjfzj[i]*100.0/fgsssjfzj;	

			%>
			  <td ><%=jbsjsszj[i]%></td>
			  <td ><%=cf.round(jbsjsszjzb,1)%>%</td>
			  <td ><%=jbfgsczzj[i]%></td>
			  <td ><%=cf.round(jbfgsczzjzb,1)%>%</td>
			  <td ><%=jbfgsssjfzj[i]%></td>
			  <td ><%=cf.round(jbfgsssjfzjzb,1)%>%</td>
			<%
			}
			%>
			</tr>
			<%



%>
</table>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close();
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>