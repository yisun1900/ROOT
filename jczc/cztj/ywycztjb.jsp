<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090419'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ҵ��Ա��ֵͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[ҵ��Ա��ֵͳ��]��"+xtrzyhmc+"') ";
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

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");
String ywy=cf.GB2Uni(request.getParameter("ywy"));

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}
if (!(dwbh.equals("")))	
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}
if (!(ywy.equals("")))	
{
	wheresql+=" and  crm_khxx.ywy='"+ywy+"'";
}


if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

String getywy=null;
String olddm="";
String dm=null;
String fgsbh=null;
long qys=0;
double qye=0;
double suijin=0;
double wdzgce=0;
double zhzjxje=0;
double zjxsuijin=0;
double zjhze=0;
double suijinze=0;
double sjf=0;
double glf=0;
double guanlif=0;
long fwmj=0;
long allqys=0;
double allqye=0;
double allsuijin=0;
double allwdzgce=0;
double allzhzjxje=0;
double allzjxsuijin=0;
double allzjhze=0;
double allsuijinze=0;
double allsjf=0;
double allglf=0;
double allguanlif=0;
long allfwmj=0;
double zkl=0;
long pjde=0;
long pmjj=0;

int gsqys=0;
double gsqye=0;
double gswdzgce=0;
int cwqys=0;
double cwqye=0;
double cwwdzgce=0;

int allgsqys=0;
double allgsqye=0;
double allgswdzgce=0;
int allcwqys=0;
double allcwqye=0;
double allcwwdzgce=0;
double allcwssk=0;
double cwssk=0;
double zjxguanlif=0;
double allzjxguanlif=0;


int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>ҵ��Ա��ֵͳ��<BR>
  (ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >

<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:550px"> 

<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="320%" style='FONT-SIZE: 13px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">����</td>
  <td  width="4%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">ҵ��Ա</td>
  <td  width="6%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�ֹ�˾</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">ǩԼ��</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">δ���۹��̶�(����˰������)</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�ۿ���</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">����ǩԼ��(����˰������)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">˰��(�ۺ�)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�����(�ۺ�)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">��װҵ��(����+˰��+�����)</td>

  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�ͻ���(��˾���տ�)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�ͻ���(�������տ�)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">��װʵ�տ�</font></td>

  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">��Ʒ�</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�����</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�ۺ󹤳�������(����˰������)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">������˰��(�ۺ�)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">����������(�ۺ�)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">������С��(����+˰��+�����)</td>

  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">�������ܶ�(����+˰��+�����)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">������˰���ܶ�</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">����ƽ��</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">ƽ�׾���</td>
  
 </tr>
<%
	//��ȡ�����

		ls_sql=" SELECT ywy,dwmc,fgsbh,sum(qys) qys,sum(qye) qye,sum(suijin) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(zjxguanlif) zjxguanlif,sum(zjhze) zjhze,sum(suijinze) suijinze,sum(sjf) sjf,sum(glf) glf,sum(guanlif) guanlif,sum(fwmj) fwmj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT ywy,dwmc,crm_khxx.fgsbh,count(*) qys,sum(qye) qye,sum(NVL(suijin,0)) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(zjxguanlif) zjxguanlif,sum(qye+NVL(zhzjxje,0)) zjhze,sum(NVL(suijin,0)+NVL(zjxsuijin,0)) suijinze,sum(NVL(sjf,0)) sjf,sum(NVL(glf,0)) glf,sum(NVL(guanlif,0)) guanlif,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.ywy is not null";
		ls_sql+=wheresql;
		ls_sql+=" group by ywy,dwmc,crm_khxx.fgsbh";

		if (ywy.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc ywy,dwmc,sq_yhxx.ssfgs fgsbh,0 qys,0 qye,0 suijin,0 wdzgce,0 zhzjxje,0 zjxsuijin,0 zjxguanlif,0 zjhze,0 suijinze,0 sjf,0 glf,0 guanlif,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh and zwbm in('19','24') and sfzszg in('Y','N')";
			ls_sql+=wheresql1;
		}

		ls_sql+=" ) ";

		ls_sql+=" group by ywy,dwmc,fgsbh";
		ls_sql+=" order by qye desc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getywy=rs.getString("ywy");
			dm=rs.getString("dwmc");
			fgsbh=rs.getString("fgsbh");
			qys=rs.getInt("qys");
			qye=rs.getDouble("qye");
			suijin=rs.getDouble("suijin");
			wdzgce=rs.getDouble("wdzgce");
			zhzjxje=rs.getDouble("zhzjxje");
			zjxsuijin=rs.getDouble("zjxsuijin");
			zjxguanlif=rs.getDouble("zjxguanlif");
			zjhze=rs.getDouble("zjhze");
			suijinze=rs.getDouble("suijinze");
			sjf=rs.getDouble("sjf");
			glf=rs.getDouble("glf");
			guanlif=rs.getDouble("guanlif");
			fwmj=rs.getLong("fwmj");


			ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+getywy+"' and jzkscsj is not null";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gsqys=rs1.getInt("qys");
				gsqye=rs1.getDouble("qye");
				gswdzgce=rs1.getDouble("wdzgce");
			}
			rs1.close();
			ps1.close();

			allgsqys+=gsqys;
			allgsqye+=gsqye;
			allgswdzgce+=gswdzgce;
		
			ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+getywy+"' and cwjzkscsj is not null";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cwqys=rs1.getInt("qys");
				cwqye=rs1.getDouble("qye");
				cwwdzgce=rs1.getDouble("wdzgce");
			}
			rs1.close();
			ps1.close();
			
			allcwqys+=cwqys;
			allcwqye+=cwqye;
			allcwwdzgce+=cwwdzgce;
			
			
			ls_sql=" SELECT sum(fkje) ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+getywy+"' and cw_khfkjl.fklxbm in('11','54','96') and cw_khfkjl.scbz='N' ";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cwssk=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			allcwssk+=cwssk;
			
			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(long)(qye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(long)(qye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=qye*10/wdzgce;
			}

			allqys+=qys;
			allqye+=qye;
			allsuijin+=suijin;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allglf+=glf;
			allguanlif+=guanlif;
			allzhzjxje+=zhzjxje;
			allzjxsuijin+=zjxsuijin;
			allzjxguanlif+=zjxguanlif;
			allzjhze+=zjhze;
			allsuijinze+=suijinze;
			row++;


			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}

			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" ><%=row%>
				</td>
				<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" >
					<A HREF="ViewYwycz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ywy=<%=getywy%>&dwbh=<%=fgsbh%>&jzbz=<%=jzbz%>" target="_blank">
					<%=getywy%>
					</A>
				</td>
				<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" ><%=dm%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=qys%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)wdzgce)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)qye)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijin)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(guanlif)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif))%></td>

				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gsqys%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cwqys%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)cwssk)%></td>

				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)sjf)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(glf)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zhzjxje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxsuijin)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxguanlif)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(zjxsuijin+zjxguanlif+zhzjxje))%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif+zhzjxje+zjxsuijin+zjxguanlif))%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijinze)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)pjde)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)pmjj)%></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();


%>
<tr align="center">
	<td colspan="3" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
	&nbsp;	
	</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=allqys%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.round(zkl,1)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allqye)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble(allsuijin)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allguanlif)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)(allqye+allsuijin+allguanlif))%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=allgsqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=allcwqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)allcwssk)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allglf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble(allzjxsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(allzjxguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(allzhzjxje+allzjxsuijin+allzjxguanlif))%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(allqye+allsuijin+allguanlif+allzhzjxje+allzjxsuijin+allzjxguanlif))%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble(allsuijinze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)pmjj)%></td>
</tr>
</table>

  </DIV>

</form> 
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

