<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");


	String fgs=request.getParameter("fgs");

	String yhdlm=(String)session.getAttribute("yhdlm");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	wheresql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

%>

<%
int maxsl=0;
double maxje=0;
String dwmc=null;
String sgd=null;

int allsl=0;
int allje=0;
int allbzsl=0;

		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();


	ls_sql=" delete from cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" insert into cw_tjlsb42 (xh,yhdlm,fgsbh,qddm,jzsjs,cxhdmc,cxhdbmxq,cxhdbmzh ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy ) ";
	ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,hdr,cxhdbm,cxhdbmxq,cxhdbmzh,lx ";
	//sz1:签约数
	//sz2:签约额－折前
	//sz3:签约额－折后
	//sz4:合同管理费
	//sz5:合同税金
	ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
	//sz6:增减项
	//sz7:增减项项目管理费
	//sz8:增减项税金
	//sz9:减项违约金
	ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
	//sz10:设计费
	//sz11:实收款
	//sz12:返卷总额
	//sz13:公司承担返卷
	ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

	//sz19:平均签单周期
	//sz20:房屋面积
	ls_sql+=" ,sz19,sz20,ywy ";//其它
	ls_sql+=" FROM (";


	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.hdr,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.hdbz lx";
	ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
	ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
	ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
	ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') "+wheresql;
	ls_sql+=" and crm_khxx.hdbz!='1' ";
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.hdr,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.hdbz,crm_khxx.ywy";

	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	String xh=null;
	String fgsbh=null;
	String cxhdmc=null;
	String cxhdbmxq=null;
	String cxhdbmzh=null;
	ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
	ls_sql+=" FROM cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));

		double yjxs11=10;//02：店面签约业绩系数
		double yjxs12=10;//04：家装设计师业绩系数
		double yjxs13=10;//06：业务员系数
		double yjxs14=10;//07：市场部经理系数

		if (!cxhdmc.equals(""))//公司活动
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs11=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs12=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs13=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs14=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs21=10;
		double yjxs22=10;
		double yjxs23=10;
		double yjxs24=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs21=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs22=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs23=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs24=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs31=10;
		double yjxs32=10;
		double yjxs33=10;
		double yjxs34=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs31=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs32=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs33=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs34=rs1.getDouble("yjxs");
			}
			else{
//				out.println("错误！找不到活动参数："+ls_sql);
//				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs1=10;//02：店面签约业绩系数
		double yjxs2=10;//04：家装设计师业绩系数
		double yjxs3=10;//06：业务员系数
		double yjxs4=10;//07：市场部经理系数

		yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
		yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
		yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
		yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

		//yjxs11 02：店面签约业绩系数
		//yjxs12 04：家装设计师业绩系数
		//yjxs13 06：业务员系数
		//yjxs14 07：市场部经理系数
		ls_sql=" update cw_tjlsb42 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
		ls_sql+=" where xh='"+xh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,yjxs1);
		ps1.setDouble(2,yjxs2);
		ps1.setDouble(3,yjxs3);
		ps1.setDouble(4,yjxs4);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//业绩

	//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
	//sz15:家装设计师业绩＝
	//sz16:业务员业绩＝
	//sz17:市场部经理业绩＝
	//sz18:市场部经理签约数＝

	//sz1:签约数
	//sz2:签约额－折前
	//sz3:签约额－折后
	//sz4:合同管理费
	//sz5:合同税金

	ls_sql=" update cw_tjlsb42 set sz14=sz3+sz4";
	ls_sql+=" ,sz15=sz3+sz4";
	ls_sql+=" ,sz16=sz3+sz4";
	ls_sql+=" ,sz17=sz3+sz4";
	ls_sql+=" ,sz18=1";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql=" update cw_tjlsb42 set sz14=sz3*yjxs11/10+sz4";
	ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
	ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
	ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql=" update cw_tjlsb42 set sz17=0,sz18=0";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>回单统计
  <BR>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="6%">序号</td>
          <td  width="20%">公司名称</td>
          <td  width="15%">回单类型</td>
          <td  width="15%">回单人</td>
          <td  width="10%">回单总数</td>
          <td  width="15%">店面签约业绩</td>
          <td  width="15%">平均单额</td>
        </tr>


<%


	int pm=0;
	int oldpm=0;
	int sl=0;
	int je=0;
	int bzsl=0;
	int pjje=0;

	String hdr=null;
	String lxmc=null;

	ls_sql=" select cw_tjlsb42.fgsbh,dwmc,jzsjs hdr,DECODE(lx,'2','设计师回单','3','施工队回单','公司回单') as lxmc,count(*) sl,sum(sz14) dmjlyj";
	ls_sql+=" FROM cw_tjlsb42,sq_dwxx";
	ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" group by cw_tjlsb42.fgsbh,dwmc,jzsjs,DECODE(lx,'2','设计师回单','3','施工队回单','公司回单')";
	ls_sql+=" order by cw_tjlsb42.fgsbh,DECODE(lx,'2','设计师回单','3','施工队回单','公司回单')";
	//out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		dwmc=rs.getString("dwmc");
		hdr=rs.getString("hdr");
		lxmc=rs.getString("lxmc");
		sl=rs.getInt(5);
		je=rs.getInt(6);

		allsl+=sl;
		allje+=je;

		if (sl!=0)
		{
			pjje=je/sl;
		}
		else{
			pjje=0;
		}


		if (oldpm!=je)
		{
			pm++;
			oldpm=je;
		}

		if (pm%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

%>
          <td><%=pm%></td>
          <td><%=dwmc%></td>
          <td><%=lxmc%></td>
          <td><%=hdr%></td>
          <td align="right"><%=sl%></td>
          <td align="right"><%=cf.formatDouble(je)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
        </tr>
<%

	}
	ps.close();
	rs.close();


	if (allsl!=0)
	{
		pjje=allje/allsl;
	}
	else{
		pjje=0;
	}

%>
        <tr align="center" >
          <td>合计</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td align="right"><%=allsl%></td>
          <td align="right"><%=cf.formatDouble(allje)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
        </tr>
<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e+ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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
      </table>
    </td>
  </tr>
</table>
</body>
</html>
