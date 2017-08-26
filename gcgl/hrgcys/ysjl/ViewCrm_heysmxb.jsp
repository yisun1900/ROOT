<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看验收明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<%
String ysjlh=request.getParameter("ysjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String gcysbbh=null;
int yszxsl=0;//验收子项数量
int getyszxsl=0;
int byxsl=0;
int fbyxzxsl=0;
try {
	conn=cf.getConnection();

	String khbh=null;
	String gcysxmbm=null;
	String xmlx=null;//1：验收项；2：状态项
	String xlrmx=null;//需录入明细  1：不需录入；2：需录入；3：已录入
	ls_sql="select gcysbbh,gcysxmbm,khbh,xmlx,xlrmx";
	ls_sql+=" from  crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xmlx=cf.fillNull(rs.getString("xmlx"));
		xlrmx=cf.fillNull(rs.getString("xlrmx"));
	}
	rs.close();
	ps.close();

	String gcysxmmc=null;
	String getysbzsm=null;
	String sfxzjg=null;//是否选择甲供
	ls_sql="select gcysxmmc,yszxsl,byxsl,fbyxzxsl,ysbzsm,sfxzjg,xmlx";
	ls_sql+=" from  dm_heysxm";
	ls_sql+=" where gcysbbh='"+gcysbbh+"'";
	ls_sql+=" and gcysxmbm='"+gcysxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		getyszxsl=rs.getInt("yszxsl");
		byxsl=rs.getInt("byxsl");
		fbyxzxsl=rs.getInt("fbyxzxsl");
		getysbzsm=cf.fillNull(rs.getString("ysbzsm"));
		sfxzjg=cf.fillNull(rs.getString("sfxzjg"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">
<div align="center">查看验收明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center">
    <td width="18%" align="right"><span class="STYLE1">验收项目编码</span></td>
    <td width="32%" align="left"><%=gcysxmbm%></td>
    <td width="18%" align="right"><span class="STYLE1">验收项目名称</span></td>
    <td width="32%" align="left"><%=gcysxmmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td align="right"><span class="STYLE1">验收子项数量</span></td>
    <td align="left"><%=getyszxsl%></td>
    <td align="right">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td align="right"><span class="STYLE1">必验项数量</span></td>
    <td align="left"><%=byxsl%></td>
    <td align="right"><span class="STYLE1">非必验项最小数量</span></td>
    <td align="left"><%=fbyxzxsl%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td align="right"><span class="STYLE1">验收标准说明</span></td>
    <td colspan="3" align="left"><%=getysbzsm%></td>
  </tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center">
    <td width="5%"><strong>分 项</strong></td>
    <td width="28%"><strong>验收子项名</strong></td>
    <td width="5%"><strong>必验项</strong></td>
    <td width="20%"><strong>验收说明</strong></td>
    <td width="6%"><strong>验收结果</strong></td>
    <td width="31%"><strong>备注</strong></td>
    <%
	if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
	{
		%>
		<td width="5%"><strong>施工方</strong></td>
		<%
	}
	%>
    </tr>

<%
	if (xlrmx.equals("1"))//1：不需录入；2：需录入；3：已录入
	{
		out.println("无明细");
		return;
	}
	if (xmlx.equals("2"))//1：验收项；2：状态项
	{
		out.println("无明细");
		return;
	}

	String ys=null;
	String byx=null;
	String byxmc=null;
	String ysbztp=null;
	String ysbzsm=null;
	String xmfl=null;
	String ysjg=null;
	int hbx=0;


	ls_sql="select yszxsl,ys1,byx1,ysbztp1,ysbzsm1,xmfl1,hbx1,ysjg1,ys2,byx2,ysbztp2,ysbzsm2,xmfl2,hbx2,ysjg2,ys3,byx3,ysbztp3,ysbzsm3,xmfl3,hbx3,ysjg3,ys4,byx4,ysbztp4,ysbzsm4,xmfl4,hbx4,ysjg4,ys5,byx5,ysbztp5,ysbzsm5,xmfl5,hbx5,ysjg5,ys6,byx6,ysbztp6,ysbzsm6,xmfl6,hbx6,ysjg6,ys7,byx7,ysbztp7,ysbzsm7,xmfl7,hbx7,ysjg7,ys8,byx8,ysbztp8,ysbzsm8,xmfl8,hbx8,ysjg8,ys9,byx9,ysbztp9,ysbzsm9,xmfl9,hbx9,ysjg9,ys10,byx10,ysbztp10,ysbzsm10,xmfl10,hbx10,ysjg10,ys11,byx11,ysbztp11,ysbzsm11,xmfl11,hbx11,ysjg11,ys12,byx12,ysbztp12,ysbzsm12,xmfl12,hbx12,ysjg12,ys13,byx13,ysbztp13,ysbzsm13,xmfl13,hbx13,ysjg13,ys14,byx14,ysbztp14,ysbzsm14,xmfl14,hbx14,ysjg14,ys15,byx15,ysbztp15,ysbzsm15,xmfl15,hbx15,ysjg15,ys16,byx16,ysbztp16,ysbzsm16,xmfl16,hbx16,ysjg16,ys17,byx17,ysbztp17,ysbzsm17,xmfl17,hbx17,ysjg17,ys18,byx18,ysbztp18,ysbzsm18,xmfl18,hbx18,ysjg18,ys19,byx19,ysbztp19,ysbzsm19,xmfl19,hbx19,ysjg19,ys20,byx20,ysbztp20,ysbzsm20,xmfl20,hbx20,ysjg20,ys21,byx21,ysbztp21,ysbzsm21,xmfl21,hbx21,ysjg21,ys22,byx22,ysbztp22,ysbzsm22,xmfl22,hbx22,ysjg22,ys23,byx23,ysbztp23,ysbzsm23,xmfl23,hbx23,ysjg23,ys24,byx24,ysbztp24,ysbzsm24,xmfl24,hbx24,ysjg24,ys25,byx25,ysbztp25,ysbzsm25,xmfl25,hbx25,ysjg25,ys26,byx26,ysbztp26,ysbzsm26,xmfl26,hbx26,ysjg26,ys27,byx27,ysbztp27,ysbzsm27,xmfl27,hbx27,ysjg27,ys28,byx28,ysbztp28,ysbzsm28,xmfl28,hbx28,ysjg28,ys29,byx29,ysbztp29,ysbzsm29,xmfl29,hbx29,ysjg29,ys30,byx30,ysbztp30,ysbzsm30,xmfl30,hbx30,ysjg30,ys31,byx31,ysbztp31,ysbzsm31,xmfl31,hbx31,ysjg31,ys32,byx32,ysbztp32,ysbzsm32,xmfl32,hbx32,ysjg32,ys33,byx33,ysbztp33,ysbzsm33,xmfl33,hbx33,ysjg33,ys34,byx34,ysbztp34,ysbzsm34,xmfl34,hbx34,ysjg34,ys35,byx35,ysbztp35,ysbzsm35,xmfl35,hbx35,ysjg35,ys36,byx36,ysbztp36,ysbzsm36,xmfl36,hbx36,ysjg36,ys37,byx37,ysbztp37,ysbzsm37,xmfl37,hbx37,ysjg37,ys38,byx38,ysbztp38,ysbzsm38,xmfl38,hbx38,ysjg38,ys39,byx39,ysbztp39,ysbzsm39,xmfl39,hbx39,ysjg39,ys40,byx40,ysbztp40,ysbzsm40,xmfl40,hbx40,ysjg40,ys41,byx41,ysbztp41,ysbzsm41,xmfl41,hbx41,ysjg41,ys42,byx42,ysbztp42,ysbzsm42,xmfl42,hbx42,ysjg42,ys43,byx43,ysbztp43,ysbzsm43,xmfl43,hbx43,ysjg43,ys44,byx44,ysbztp44,ysbzsm44,xmfl44,hbx44,ysjg44,ys45,byx45,ysbztp45,ysbzsm45,xmfl45,hbx45,ysjg45,ys46,byx46,ysbztp46,ysbzsm46,xmfl46,hbx46,ysjg46,ys47,byx47,ysbztp47,ysbzsm47,xmfl47,hbx47,ysjg47,ys48,byx48,ysbztp48,ysbzsm48,xmfl48,hbx48,ysjg48,ys49,byx49,ysbztp49,ysbzsm49,xmfl49,hbx49,ysjg49,ys50,byx50,ysbztp50,ysbzsm50,xmfl50,hbx50,ysjg50 ";
	ls_sql+=" from  dm_heysxmpz";
	ls_sql+=" where gcysxmbm='"+gcysxmbm+"'";
	ls_sql+=" and gcysbbh='"+gcysbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yszxsl=rs.getInt("yszxsl");

		ls_sql="select ys1,sm1,sgf1,ys2,sm2,sgf2,ys3,sm3,sgf3,ys4,sm4,sgf4,ys5,sm5,sgf5,ys6,sm6,sgf6,ys7,sm7,sgf7,ys8,sm8,sgf8,ys9,sm9,sgf9,ys10,sm10,sgf10,ys11,sm11,sgf11,ys12,sm12,sgf12,ys13,sm13,sgf13,ys14,sm14,sgf14,ys15,sm15,sgf15,ys16,sm16,sgf16,ys17,sm17,sgf17,ys18,sm18,sgf18,ys19,sm19,sgf19,ys20,sm20,sgf20,ys21,sm21,sgf21,ys22,sm22,sgf22,ys23,sm23,sgf23,ys24,sm24,sgf24,ys25,sm25,sgf25,ys26,sm26,sgf26,ys27,sm27,sgf27,ys28,sm28,sgf28,ys29,sm29,sgf29,ys30,sm30,sgf30,ys31,sm31,sgf31,ys32,sm32,sgf32,ys33,sm33,sgf33,ys34,sm34,sgf34,ys35,sm35,sgf35,ys36,sm36,sgf36,ys37,sm37,sgf37,ys38,sm38,sgf38,ys39,sm39,sgf39,ys40,sm40,sgf40,ys41,sm41,sgf41,ys42,sm42,sgf42,ys43,sm43,sgf43,ys44,sm44,sgf44,ys45,sm45,sgf45,ys46,sm46,sgf46,ys47,sm47,sgf47,ys48,sm48,sgf48,ys49,sm49,sgf49,ys50,sm50,sgf50";
		ls_sql+=" from  crm_heysmxb";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();

		boolean cxjg=rs1.next();
		if (!cxjg)
		{
			out.println("错误！无验收明细，请从【录入项目】按钮录入");
			return;
		}

		for (int i=0;i<yszxsl ;i++ )
		{
			ys=cf.fillNull(rs.getString("ys"+(i+1)));
			byx=cf.fillNull(rs.getString("byx"+(i+1)));
			ysbztp=cf.fillNull(rs.getString("ysbztp"+(i+1)));
			ysbzsm=cf.fillNull(rs.getString("ysbzsm"+(i+1)));
			xmfl=cf.fillNull(rs.getString("xmfl"+(i+1)));
			ysjg=cf.fillNull(rs.getString("ysjg"+(i+1)));
			hbx=rs.getInt("hbx"+(i+1));


			ysbzsm=ysbzsm.replace("\r\n","<BR>");

			String getys="";
			String getsm="";
			String getsgf="";
			if (cxjg)
			{
				getys=cf.fillNull(rs1.getString("ys"+(i+1)));
				getsm=cf.fillNull(rs1.getString("sm"+(i+1)));
				getsgf=cf.fillNull(rs1.getString("sgf"+(i+1)));
			}
			
			
			String bgcolor="";
			if (byx.equals("1"))//0.否 1.必验项
			{
				if (ysjg.equals("1"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					byxmc="必验项";
					bgcolor="#FFFF66";
				}
				else if (ysjg.equals("2"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					byxmc="必选项";
					bgcolor="#FFFF66";
				}
				else{
					byxmc="必添";
					bgcolor="#FFFF66";
				}
			}
			else{
				byxmc="否";
				bgcolor="#FFFFFF";
			}

			if (ysjg.equals(""))
			{
				ysjg="1";
			}

			if (ysjg.equals("1"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
				  </td>
				  <td align="left"><%=ysbzsm%></td>
				  <td ><%cf.radioToken(out, "合格+合格<BR>&不合格+整改",getys,false);%></td>
				  <td  align="left"><%=getsm%>
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td>&nbsp;</td>
						<%
					}
					%>
				  </tr>
				<%
			}
			else if (ysjg.equals("2"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
				  </td>
				  <td align="left"><%=ysbzsm%></td>
				  <td ><%cf.radioToken(out,"是+是<BR>&否+否",getys,false);%></td>

				  <td >&nbsp;</td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td>&nbsp;</td>
						<%
					}
					%>
				  </tr>
				<%
			}
			else if (ysjg.equals("3"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
				  </td>
				  <td colspan="3" align="left"><%=getys%>
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td>&nbsp;</td>
						<%
					}
					%>
				  </tr>
				<%
			}
			else if (ysjg.equals("4"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
				  </td>
				  <td colspan="3" align="left"><%=getys%>
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td>&nbsp;</td>
						<%
					}
					%>
				  </tr>
				<%
			}
			else if (ysjg.equals("5"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
				  </td>
				  <td colspan="3" align="left"><%=getys%>
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td>&nbsp;</td>
						<%
					}
					%>
				  </tr>
				<%
			}
			else//9：显示说明
			{
				if (!ys.equals(""))
				{
					ysbzsm=ys+"：<BR>"+ysbzsm;
				}
				%>
				<tr bgcolor="#FFFFFF" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left" colspan="5"><%=ysbzsm%>
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td>&nbsp;</td>
						<%
					}
					%>

				</tr>
				<%
			}

		}

		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
%>


</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>


