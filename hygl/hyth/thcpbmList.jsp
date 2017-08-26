<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String thdw=request.getParameter("thdw");
String thrq=request.getParameter("thrq");
String thczy=request.getParameter("czy");
String[] cpbmlist=request.getParameterValues("cpbmlist");
if (cpbmlist==null)
{
	out.println("请输入退货产品条码！");
	return;
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form name="thlist" method="post" action="savethList.jsp">
  <input type="hidden" name="thdw"  value="<%=thdw%>">
  <input type="hidden" name="thrq"  value="<%=thrq%>">
  <input type="hidden" name="thczy"  value="<%=thczy%>">
<table width="100%">
<%

String dwbh=null;
String dwmc=null;
String ywxh=null;
String cpbm=null;
String bqj=null;
String sxj=null;
String zkl=null;
String sjzkl=null;
String khlx=null;
String khlxmc=null;
String khbh=null;
String hykh=null;
String jyfsmc=null;
String jyfs=null;
String czy=null;
String xsrq=null;
String zkcx=null;
String shbz=null;
String shr=null;
String shrq=null;
String sfjs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

String cplb=null;
String bkbh=null;
String plmc=null;
String zp=null;
String hyxm="";
String hyjb="";
String fwlx="";
double xfzje=0;
int jf=0;
int row=0;

String wlzt="";
String ktbz="";
try {
	conn=cf.getConnection();

for (int i=0;i<cpbmlist.length ;i++ )
{
	//马学中2003.9.24修改，原因：销售的产品应该到cp_cpxx1中读取
	//ls_sql=" select wlzt,ktbz from  cp_cpxx where cpbm='"+cpbmlist[i]+"'";
	ls_sql=" select wlzt,ktbz from  cp_cpxx1 where cpbm='"+cpbmlist[i]+"'";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		wlzt=rs.getString(1);
		ktbz=cf.fillNull(rs.getString(2));
		if (!wlzt.equals("05"))
		{
			out.println("产品条码："+cpbmlist[i]+"不是已销售产品！");
			return;
		}
/*
*/
		if (ktbz.equals("1"))//0可退1不可退
		{
//			out.println("产品条码："+cpbmlist[i]+"不可退！");
//			return;
		}
	}
	else{
		out.println("产品条码："+cpbmlist[i]+"不存在！");
		return;
	}
//11111111开始if///////////////////////////////
	ls_sql="select dm_xsjl.dwbh,dwmc,dm_xsjl.ywxh,dm_xsjl.cpbm,dm_xsjl.bkbh,plmc,dm_xsjl.bqj,dm_xsjl.sxj";
	ls_sql+=" ,dm_xsjl.zkl,dm_xsjl.sjzkl,DECODE(dm_xsjl.khlx,0,'一般客户',1,'会员') khlxmc,dm_xsjl.khlx";
	ls_sql+=" ,dm_xsjl.khbh,DECODE(dm_xsjl.jyfs,0,'现金',1,'非现金') jyfsmc,dm_xsjl.jyfs jyfs";
	ls_sql+=" ,dm_xsjl.czy,dm_xsjl.xsrq,DECODE(dm_xsjl.zkcx,0,'未超限',1,'超限') zkcx";
	ls_sql+=" ,DECODE(shbz,0,'未通过',1,'通过',9,'未审核') shbz,shr,shrq";
	ls_sql+=" ,DECODE(sfjs,0,'未结算',1,'结算') sfjs,zp,DECODE(dm_xsjl.cplb,'B','素金类','A','镶嵌类') cplb";
	ls_sql+=" from  dm_xsjl,xt_plbm,v_bk,sq_dwxx";
	ls_sql+=" where  dm_xsjl.cpbm='"+cpbmlist[i]+"' ";
	ls_sql+=" and dm_xsjl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and dm_xsjl.plbm=xt_plbm.plbm(+) and dm_xsjl.bkbh=v_bk.bkbh(+)";
	
//	out.println(ls_sql);
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		row++;
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=rs.getString("dwmc");
		ywxh=cf.fillNull(rs.getString("ywxh"));
		cpbm=cf.fillNull(rs.getString(4));
		bqj=cf.fillNull(rs.getString("bqj"));
		bkbh=cf.fillNull(rs.getString("bkbh"));
		plmc=cf.fillNull(rs.getString("plmc"));
		sxj=cf.fillNull(rs.getString("sxj"));
		zkl=cf.fillNull(rs.getString("zkl"));
		sjzkl=cf.fillNull(rs.getString("sjzkl"));
		khlxmc=cf.fillNull(rs.getString("khlxmc"));
		khlx=cf.fillNull(rs.getString("khlx"));
		khbh=cf.fillNull(rs.getString("khbh"));
		jyfsmc=cf.fillNull(rs.getString("jyfsmc"));
		jyfs=cf.fillNull(rs.getString("jyfs"));
		czy=cf.fillNull(rs.getString("czy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		zkcx=cf.fillNull(rs.getString("zkcx"));
		shbz=cf.fillNull(rs.getString("shbz"));
		shr=cf.fillNull(rs.getString("shr"));
		shrq=cf.fillNull(rs.getDate("shrq"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		zp=cf.fillNull(rs.getString("zp"));
		cplb=cf.fillNull(rs.getString("cplb"));
		if (dwmc==null)
		{
			out.println("错误！销售单位不存在，单位编码："+dwbh);
			return;
		}
	
//		out.println("cpbm="+cpbm);
		
%>	
  <tr>
    <td width="100%" height="182"> 
      <div align="center">

          <table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="6"><b>第<%=row%>件货物，条码：<%=cpbm%></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">销售单位</div>
              </td>
              <td width="18%"> <%=dwmc%></td>
              <td width="14%" align="right">销售序号</td>
              <td width="18%"><%=ywxh%></td>
              <td rowspan="8" colspan="2"><%=zp%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">品名</td>
              <td colspan="3"><%=plmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">产品类别</td>
              <td width="18%"><%=cplb%></td>
              <td width="14%" align="right">版库编号</td>
              <td width="18%"><%=bkbh%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">标签价</td>
              <td width="18%"><%=bqj%></td>
              <td width="14%" align="right">实销价</td>
              <td width="18%"><%=sxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">最低折扣率</td>
              <td width="18%"><%=zkl%>%</td>
              <td width="14%" align="right">实际折扣率</td>
              <td width="18%"><%=sjzkl%>% </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">交易方式</td>
              <td width="18%"><%=jyfsmc%></td>
              <td width="14%" align="right">是否结算</td>
              <td width="18%"><%=sfjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">销售员</div>
              </td>
              <td width="18%"><%=czy%> </td>
              <td width="14%" align="right">销售日期</td>
              <td width="18%"><%=xsrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="18%"><%=khlxmc%></td>
              <td width="14%" align="right">折扣超限</td>
              <td width="18%"><%=zkcx%></td>
            </tr>
<%
//222222222222222开始显示会员信息////////////////////////////////////////////////////////
		if (!khbh.equals(""))
		{
			ls_sql="select hyxm,hy_hyxxb.hyjb,DECODE(fwlx,1,'基本服务',2,'增值服务'),xfzje,jf,hykh";
			ls_sql+=" FROM hy_hyxxb,hy_hyjbb ";
			ls_sql+=" WHERE hy_hyxxb.hybh='"+khbh+"' AND hy_hyxxb.hyjb=hy_hyjbb.hyjbbh(+)"; 
//			out.println(ls_sql);
			ps1=conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				hyxm=cf.fillNull(rs1.getString("hyxm"));
				hyjb=cf.fillNull(rs1.getString(2));
				fwlx=cf.fillNull(rs1.getString(3));
				xfzje=rs1.getDouble("xfzje");
				jf=rs1.getInt("jf");
				hykh=cf.fillNull(rs1.getString("hykh"));
%> 
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">会员编号</div>
              </td>
              <td width="18%"> <%=khbh%> </td>
              <td width="14%" align="right">水质分析卡号</td>
              <td width="18%"><%=hykh%></td>
              <td width="14%"> 
                <div align="right">会员级别</div>
              </td>
              <td width="22%"><%=hyjb%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">会员姓名</td>
              <td width="18%"><%=hyxm%></td>
              <td width="14%" align="right">消费总金额</td>
              <td width="18%"><%=xfzje%></td>
              <td width="14%" align="right">积分</td>
              <td width="22%"><%=jf%> </td>
            </tr>
            <%
			}
			rs1.close();
			ps1.close();
		}
//2222222222222结束显示会员信息////////////////////////////////////////
%> 
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">超折审核</div>
              </td>
              <td width="18%"><%=shbz%></td>
              <td width="14%" align="right">审核人</td>
              <td width="18%"><%=shr%></td>
              <td width="14%"> 
                <div align="right">审核日期</div>
              </td>
              <td width="22%"><%=shrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="6"><b>附属赠品销售信息</b></td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td width="14%">序号</td>
              <td width="18%">赠品编码</td>
              <td width="14%">数量</td>
              <td width="18%">品名</td>
              <td width="14%">单件重量</td>
              <td width="22%">赠品类型</td>
            </tr>
            <%
//333333333333333/////////////////开始显示附属赠品销售信息//////////////////////
	long xh=0;
	String zpbm=null;
	String zplx=null;
	int sl=0;
	double djzl=0;
	ls_sql="SELECT xh,zpbm,plmc,sl,djzl,DECODE(zplx,1,'成品转入',2,'赠品')  ";
	ls_sql+=" FROM dm_zpxs,xt_plbm  ";
    ls_sql+=" WHERE dm_zpxs.plbm=xt_plbm.plbm  and ywxh='"+ywxh+"' and cpbm='"+cpbm+"'";
//	out.println(ls_sql);
	ps1=conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while (rs1.next())
	{
		xh=rs1.getLong("xh");
		zpbm=rs1.getString("zpbm");
		plmc=rs1.getString("plmc");
		sl=rs1.getInt("sl");
		djzl=rs1.getDouble("djzl");
		zplx=rs1.getString(6);
%> 
            <tr bgcolor="#FFFFFF" align="center"> 
              <td width="14%"><%=xh%></td>
              <td width="18%"><%=zpbm%></td>
              <td width="18%"><%=sl%></td>
              <td width="14%"><%=plmc%></td>
              <td width="14%"><%=djzl%></td>
              <td width="22%"><%=zplx%></td>
            </tr>
            <%
	}
	rs1.close();
	ps1.close();
//3333333333/////////////////结束显示附属赠品销售信息//////////////////////
	String thlx="";
	if (dwbh.equals(thdw))
	{
		thlx="0";
	}
	else{
		thlx="1";
	}
%> 
            <tr bgcolor="#FFFFCC"> 
              <td width="14%" align="right">退货类型</td>
              <td width="18%"> 
                <input type="hidden" name="jyfs"  value="<%=jyfs%>">
                <input type="hidden" name="dwbh"  value="<%=dwbh%>">
                <input type="hidden" name="sxj"  value="<%=sxj%>">
                <input type="hidden" name="ywxh"  value="<%=ywxh%>">
                <input type="hidden" name="khbh"  value="<%=khbh%>">
                <input type="hidden" name="khlx"  value="<%=khlx%>">
                <input type="hidden" name="cpbm"  value="<%=cpbm%>">

				<select name="thlx" style="FONT-SIZE:12px;WIDTH:83px">
<%
				if (thlx.equals("0"))
				{
					out.println("<option value=\"0\">本店退货</option>");
				}
				else{
					out.println("<option value=\"1\">异店换货</option>");
					out.println("<option value=\"2\">异店退货</option>");
				}
%> 
				</select>
              </td>
              <td rowspan="2" align="right">退货原因</td>
              <td colspan="3" rowspan="2"> 
                <textarea name="thyy" cols="35" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="14%"> 
                <div align="right">退货金额</div>
              </td>
              <td width="18%"> 
                <input type="text" name="thj" size="10">
              </td>
            </tr>
          </table>
	  </div>
    </td>
  </tr>
<%
	}
	else{
		out.println("错误！无销售记录");
		return;
	}
//1111111111111结束if///////////////////////////////
	rs.close();
	ps.close();
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
  <tr align="center"> 
    <td width="100%" height="2">
      <input type="submit" name="Submit" value="确定">
    </td>
  </tr>
</table>
</form>
</body>
</html>
