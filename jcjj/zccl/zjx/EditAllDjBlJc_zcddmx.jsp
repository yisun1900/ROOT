<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String xh=null;
String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
double sl=0;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
double qtfyje=0;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;
String sxbz=null;
String sxbzmc=null;
String sxhtyy=null;
String sfzp=null;
double zsdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int allrow=0;
int row=0;
int row1=0;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<title>请修改主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


 <div align="center">请修改增减项明细（增减项编号：<%=zjxbh%>）</div>


<DIV style="DISPLAY: inline; OVERFLOW: auto;  WIDTH: 100%;  HEIGHT:97%"> 

<B>对原订货进行增减：</B>
<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="270%" style='FONT-SIZE: 12px'>
<form method="post" action="" name="editform">
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="1%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
	<td  width="3%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材编码</td>
	<td  width="5%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材名称</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">型号</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">规格</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">颜色</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">铺装位置</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">原数量</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折前单价</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折后单价</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计量单位</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">增减数量</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折前增减材料费</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折扣增减材料费</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">增减远程费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">其它费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">增减其它费金额</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">是否赠品</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">赠送单价</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">参加促销活动</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计入促销活动比率</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">增减计入活动金额</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">手写标志</td>
	<td  width="5%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">手写合同原因</td>
	<td  width="4%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">修改手写合同</td>
	<td  width="19%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">备注</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">选择价格</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">原材料费</td>
</tr>


<%

	double zjsl=0;
	double zqzjje=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;
	double zjcbje=0;

	String zjhsl=null;
	String zjhje=null;
	String zjhycf=null;
	String zjhqtfy=null;
	String zjhcxhdje=null;

	ls_sql="select jc_zcddmx.sfzp,jc_zcddmx.zsdj,jc_zcddmx.xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz ";
	ls_sql+=" ,jldwbm,qtfy,xzjg,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj ";
	ls_sql+=" ,lscxhdbl,DECODE(sftjcp,'Y','是','N','否') sftjcp";
	ls_sql+=" ,jc_zcddmx.sxbz,DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写') sxbzmc,sxhtyy ";
	ls_sql+=" ,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zjhcxhdje";

	ls_sql+=" ,jc_zczjxmx.zjsl,jc_zczjxmx.zqzjje,jc_zczjxmx.zjje,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zczjxmx.zjcbje,jc_zczjxmx.bz ";
	
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" and jc_zczjxmx.lx='1' ";//1：已有项目；2：新增项目
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));

		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		zjhje=cf.fillNull(rs.getString("zjhje"));
		zjhycf=cf.fillNull(rs.getString("zjhycf"));
		zjhqtfy=cf.fillNull(rs.getString("zjhqtfy"));
		zjhcxhdje=cf.fillNull(rs.getString("zjhcxhdje"));

		zjsl=rs.getDouble("zjsl");
		zqzjje=rs.getDouble("zqzjje");
		zjje=rs.getDouble("zjje");
		zjycf=rs.getDouble("zjycf");
		zjqtfy=rs.getDouble("zjqtfy");
		zjcxhdje=rs.getDouble("zjcxhdje");
		zjcbje=rs.getDouble("zjcbje");
		bz=cf.fillNull(rs.getString("bz"));

		String zjslStr="";
		if (zjsl!=0)
		{
			zjslStr=zjsl+"";
		}
		String zjycfStr="";
		if (zjycf!=0)
		{
			zjycfStr=zjycf+"";
		}
		String zjqtfyStr="";
		if (zjqtfy!=0)
		{
			zjqtfyStr=zjqtfy+"";
		}

		%>
		<tr bgcolor="#E8E8FF"  align="center">
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<input name="xh" type="checkbox" value="<%=xh%>">
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<input type="hidden" name="bcxh1" value="<%=xh%>">
				<input type="hidden" name="zcbm" value="<%=zcbm%>">
				<A HREF="EditJc_zcddmxMain.jsp?zjxbh=<%=zjxbh%>&ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank"><%=zcbm%></A>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=zcmc%>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=xinghao%>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=gg%>
			</td>
			<td ><%=zcysbm%></td>
			<td ><%=zcpzwzbm%></td>
			<td ><%=zjhsl%>
				<input type="hidden" name="zjhsl" value="<%=zjhsl%>">
			</td>
			<td ><%=zqdj%>
				<input type="hidden" name="zqdj1" value="<%=zqdj%>">
			</td>
			<td ><%=dpzk%></td>
			<td ><%=dj%>
				<input type="hidden" name="dj1" value="<%=dj%>">
				<input type="hidden" name="cbj1" value="<%=cbj%>">
			</td>
			<td >
				<%
					cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
				%>			</td>
			<td >
				<input type="text" name="zjsl" size="7" maxlength="16"  value="<%=zjslStr%>" onChange="f_jsjg1(editform,<%=row1%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td bgcolor="#CC99FF">
				<input type="text" name="zqzjje" size="8" maxlength="16"  value="<%=zqzjje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td bgcolor="#CC99FF">
				<input type="text" name="zjje" size="8" maxlength="16"  value="<%=zjje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
                <input type="hidden" name="zjcbje"  value="<%=zjcbje%>" >
			<td >
				<input type="text" name="zjycf" size="8" maxlength="16"  value="<%=zjycf%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td >
				<input type="hidden" name="qtfy1" value="<%=qtfy%>">
				  <%
					cf.selectToken(out,"1+安装费&2+加工费&3+其它收费&W+无",qtfy,true);
				  %>
			</td>
			<td >
				<input type="text" name="zjqtfy" size="8" maxlength="16"  value="<%=zjqtfy%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td >
				  <%
					cf.selectToken(out,"Y+赠品&N+否",sfzp,true);
				  %>
			</td>
			<td ><%=zsdj%></td>
			<td >
				<input type="hidden" name="cxhdbz1" value="<%=cxhdbz%>">
				<%
					cf.radioToken(out,"Y+参加&N+不参加",cxhdbz,true);
				%>			</td>
			<td><%=cxhdbl%>%
				<input type="hidden" name="cxhdbl1" value="<%=cxhdbl%>" >			</td>
			<td bgcolor="#CC99FF">
				<input type="text" name="zjcxhdje" size="8" maxlength="16"  value="<%=zjcxhdje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td ><%=sxbzmc%></td>
			<td ><%=sxhtyy%></td>
			<td >
				<A HREF="EditJc_zcddmxMain.jsp?zjxbh=<%=zjxbh%>&ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">增减数量</A>
			</td>
			<td >
				<input name="bz1" type="text" value="<%=bz%>" size="67" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td>
				<%
					cf.radioToken(out,"0+手写项&1+销价&2+促销价&3+市场价",xzjg,true);
				%>			</td>
			<td ><%=zjhje%></td>
		</tr>
		<%

		row1++;

		allrow++;
	}
	rs.close();
	ps.close();
%>

</table>

<P>
<B>新增订货：</B>
<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="270%" style='FONT-SIZE: 12px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="1%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
	<td  width="3%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材编码</td>
	<td  width="5%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材名称</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">型号</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">规格</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">颜色</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">铺装位置</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">选择价格</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折前单价</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折扣</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折后单价</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">计量单位</span></td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">数量</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折前材料费</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折后材料费</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">远程费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">选择其它费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">其它费金额</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">是否赠品</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">赠送单价</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">参加促销活动</span></td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计入促销活动比率</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">计入促销活动金额</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">手写标志</td>
	<td  width="5%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">手写合同原因</td>
	<td  width="4%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">修改手写合同</td>
	<td  width="19%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">备注</td>
	<td  width="7%" colspan="3" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">系列</td>
</tr>

<%

	ls_sql="select jc_zcddmx.sfzp,jc_zcddmx.zsdj,jc_zcddmx.xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz ";
	ls_sql+=" ,jldwbm,qtfy,xzjg,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj ";
	ls_sql+=" ,lscxhdbl,DECODE(sftjcp,'Y','是','N','否') sftjcp,jc_zcddmx.cbj ";
	ls_sql+=" ,jc_zcddmx.sxbz,DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写') sxbzmc,sxhtyy ";
	ls_sql+=" ,jc_zczjxmx.zjsl,jc_zczjxmx.zqzjje,jc_zczjxmx.zjje,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zczjxmx.zjcbje,jc_zczjxmx.bz ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" and jc_zczjxmx.lx='2' ";//1：已有项目；2：新增项目
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		cbj=rs.getDouble("cbj");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));

		zjsl=rs.getDouble("zjsl");
		zqzjje=rs.getDouble("zqzjje");
		zjje=rs.getDouble("zjje");
		zjycf=rs.getDouble("zjycf");
		zjqtfy=rs.getDouble("zjqtfy");
		zjcxhdje=rs.getDouble("zjcxhdje");
		zjcbje=rs.getDouble("zjcbje");
		bz=cf.fillNull(rs.getString("bz"));

		String slStr="";
		if (zjsl!=0)
		{
			slStr=zjsl+"";
		}
		String ycfStr="";
		if (zjycf!=0)
		{
			ycfStr=zjycf+"";
		}
		String qtfyjeStr="";
		if (zjqtfy!=0)
		{
			qtfyjeStr=zjqtfy+"";
		}

		if (sxbz.equals("2"))//手写合同
		{
			%>
			<tr bgcolor="#E8E8FF"  align="center">
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<input name="xh" type="checkbox" value="<%=xh%>">
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<A HREF="EditJc_zcddmxMain.jsp?zjxbh=<%=zjxbh%>&ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank"><%=zcbm%></A>
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<%=zcmc%>
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<%=xinghao%>
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<%=gg%>
				</td>
				<td><%=zcysbm%></td>
				<td><%=zcpzwzbm%></td>
				<td >手写项</td>
				<td ><%=zqdj%></td>
				<td ><%=dpzk%></td>
				<td ><%=dj%></td>
				<td ><%=jldwbm%></td>
				<td ><%=slStr%></td>
				<td ><%=zqje%></td>
				<td ><%=je%></td>
				<td ><%=ycfStr%></td>
				<td >
					  <%
						cf.selectToken(out,"1+安装费&2+加工费&3+其它收费&W+无",qtfy,true);
					  %>
				</td>
				<td ><%=qtfyjeStr%>
				<td >
					  <%
						cf.selectToken(out,"Y+赠品&N+否",sfzp,true);
					  %>
				</td>
				<td ><%=zsdj%></td>
				<td  >
					<%
						cf.radioToken(out,"Y+参加&N+不参加",cxhdbz,true);
					%>			
				</td>
				<td  ><%=cxhdbl%>%</td>
				<td ><%=cxhdje%></td>
				<td ><%=sxbzmc%></td>
				<td ><%=sxhtyy%></td>
				<td bgcolor="#FFFFFF">
					<A HREF="EditJc_zcddmxMain.jsp?zjxbh=<%=zjxbh%>&ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">修改手写合同</A>
				</td>
				<td ><%=bz%></td>
				<td  colspan="3"><%=zclbbm%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<input name="xh" type="checkbox" value="<%=xh%>">
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<input type="hidden" name="bcxh" value="<%=xh%>">
					<input type="hidden" name="zcbm" value="<%=zcbm%>">
					<A HREF="EditJc_zcddmxMain.jsp?zjxbh=<%=zjxbh%>&ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank"><%=zcbm%></A>
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<%=zcmc%>
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<%=xinghao%>
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<%=gg%>
				</td>
				<td >
					<input type="text" name="zcysbm" size="7" maxlength="50"  value="<%=zcysbm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td >
					<select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:80PX" >
					  <option value=""></option>
					  <%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz",zcpzwzbm);
					  %>
					</select>			</td>
				<td bgcolor="#CC99FF">
					<%
						cf.radioToken(out,"0+手写项&1+销价&2+促销价&3+市场价",xzjg,true);
					%>			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="zqdj" size="8" maxlength="16"  value="<%=zqdj%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td bgcolor="#CC99FF" >
					<input type="text" name="dpzk" size="5" maxlength="9"  value="<%=dpzk%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td>
					<input type="text" name="dj" size="8" maxlength="16"  value="<%=dj%>" onChange="f_jsjg(editform,<%=row%>)"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td bgcolor="#CC99FF">
					<%
						cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
					%>			</td>
				<td >
					<input type="text" name="sl" size="7" maxlength="16"  value="<%=slStr%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="zqje" size="8" maxlength="16"  value="<%=zqzjje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="je" size="8" maxlength="16"  value="<%=zjje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
                    <input type="hidden" name="cbj"  value="<%=cbj%>" >
                    <input type="hidden" name="cbje"  value="<%=zjcbje%>" >
				<td >
					<input type="text" name="ycf" size="8" maxlength="16"  value="<%=ycfStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td >
					<select name="qtfy" style="FONT-SIZE:12PX;WIDTH:70PX" >
					  <option value=""></option>
					  <%
						cf.selectToken(out,"1+安装费&2+加工费&3+其它收费&W+无",qtfy);
					  %>
					</select>			</td>
				<td >
					<input type="text" name="qtfyje" size="8" maxlength="16"  value="<%=qtfyjeStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td >
					<select name="sfzp" style="FONT-SIZE:12PX;WIDTH:50PX" >
					  <option value=""></option>
					  <%
						cf.selectToken(out,"Y+赠品&N+否",sfzp);
					  %>
					</select>			
				</td>
				<td >
					<input type="text" name="zsdj" size="8" maxlength="16"  value="<%=zsdj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			
				</td>
				<td bgcolor="#CC99FF" >
					<input type="hidden" name="cxhdbz" value="<%=cxhdbz%>">
					<%
						cf.radioToken(out,"Y+参加&N+不参加",cxhdbz,true);
					%>			</td>
				<td>
					<input type="text" name="cxhdbl" size="5" maxlength="9"  value="<%=cxhdbl%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">%			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="cxhdje" size="8" maxlength="16"  value="<%=zjcxhdje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td bgcolor="#CC99FF"><%=sxbzmc%></td>
				<td bgcolor="#CC99FF"><%=sxhtyy%></td>
				<td >
					<A HREF="EditJc_zcddmxMain.jsp?zjxbh=<%=zjxbh%>&ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">修改合同</A>
				</td>
				<td >
					<input name="bz" type="text" value="<%=bz%>" size="67" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td  colspan="3" bgcolor="#CC99FF"><%=zclbbm%></td>
			</tr>
			<%

			row++;
		}

		allrow++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
	<td colspan="5" align="center" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
		<input type="hidden" name="ddbh" value="<%=ddbh%>">
		<input type="hidden" name="zjxbh" value="<%=zjxbh%>">
		<input type="button" value="保存" onClick="f_do(editform)" >
		<input type="button" value='全选' onClick="f_checkAll(editform)" >
		<input type="button" value='删除被选项目' onClick="f_delete(editform)" >
	</td>
	<td colspan="23" >&nbsp;</td>
</tr>
</form>
</table>
</DIV>





</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg1(FormName,row)//参数FormName:Form的名称
{
	if (<%=row1%>==1)
	{
		var zqzjje=FormName.zqdj1.value*FormName.zjsl.value;
		zqzjje=round(zqzjje,2);
		FormName.zqzjje.value=zqzjje;

		var zjje=FormName.dj1.value*FormName.zjsl.value;
		zjje=round(zjje,2);
		FormName.zjje.value=zjje;

		var zjcxhdje=FormName.cxhdbl1.value/100*FormName.zjje.value;
		zjcxhdje=round(zjcxhdje,2);
		FormName.zjcxhdje.value=zjcxhdje;

		var zjcbje=FormName.cbj1.value*FormName.zjsl.value;
		zjcbje=round(zjcbje,2);
		FormName.zjcbje.value=zjcbje;
	}
	else{
		var zqzjje=FormName.zqdj1[row].value*FormName.zjsl[row].value;
		zqzjje=round(zqzjje,2);
		FormName.zqzjje[row].value=zqzjje;

		var zjje=FormName.dj1[row].value*FormName.zjsl[row].value;
		zjje=round(zjje,2);
		FormName.zjje[row].value=zjje;

		var zjcxhdje=FormName.cxhdbl1[row].value/100*FormName.zjje[row].value;
		zjcxhdje=round(zjcxhdje,2);
		FormName.zjcxhdje[row].value=zjcxhdje;

		var zjcbje=FormName.cbj1[row].value*FormName.zjsl[row].value;
		zjcbje=round(zjcbje,2);
		FormName.zjcbje[row].value=zjcbje;
	}
}

function f_jsjg(FormName,row)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		var dpzk=FormName.dj.value*10.0/FormName.zqdj.value;
		dpzk=round(dpzk,2);
		FormName.dpzk.value=dpzk;

		var zqje=FormName.zqdj.value*FormName.sl.value;
		zqje=round(zqje,2);
		FormName.zqje.value=zqje;

		var je=FormName.dj.value*FormName.sl.value;
		je=round(je,2);
		FormName.je.value=je;

		var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
		cxhdje=round(cxhdje,2);
		FormName.cxhdje.value=cxhdje;

		var cbje=FormName.cbj.value*FormName.sl.value;
		cbje=round(cbje,2);
		FormName.cbje.value=cbje;
	}
	else{
		var dpzk=FormName.dj[row].value*10.0/FormName.zqdj[row].value;
		dpzk=round(dpzk,2);
		FormName.dpzk[row].value=dpzk;

		var zqje=FormName.zqdj[row].value*FormName.sl[row].value;
		zqje=round(zqje,2);
		FormName.zqje[row].value=zqje;

		var je=FormName.dj[row].value*FormName.sl[row].value;
		je=round(je,2);
		FormName.je[row].value=je;

		var cxhdje=FormName.je[row].value*FormName.cxhdbl[row].value/100;
		cxhdje=round(cxhdje,2);
		FormName.cxhdje[row].value=cxhdje;

		var cbje=FormName.cbj[row].value*FormName.sl[row].value;
		cbje=round(cbje,2);
		FormName.cbje[row].value=cbje;
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if (<%=row1%>==1)
	{
		f_jsjg1(FormName,1);

		if(	javaTrim(FormName.zjsl)=="") {
			alert("请输入[增减数量]！");
			FormName.zjsl.focus();
			return false;
		}
		if(!(isFloat(FormName.zjsl, "增减数量"))) {
			return false;
		}
		if (FormName.zjsl.value=="0")
		{
			alert("请输入[增减数量]！");
			FormName.zjsl.select();
			return false;
		}
		if ( (parseFloat(FormName.zjsl.value) + parseFloat(FormName.zjhsl.value) ) <0 )
		{
			alert("[减项数量]不能超过订货数量["+FormName.zjhsl.value+"]！");
			FormName.zjsl.select();
			return false;
		}

		if(	javaTrim(FormName.zqzjje)=="") {
			alert("请输入[折前增减材料费]！");
			FormName.zqzjje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqzjje, "折前增减材料费"))) {
			return false;
		}
		if(	javaTrim(FormName.zjje)=="") {
			alert("请输入[折扣增减材料费]！");
			FormName.zjje.focus();
			return false;
		}
		if(!(isFloat(FormName.zjje, "折扣增减材料费"))) {
			return false;
		}

		if(	javaTrim(FormName.zjycf)=="") {
			alert("请输入[增减远程费]！");
			FormName.zjycf.focus();
			return false;
		}
		if(!(isFloat(FormName.zjycf, "增减远程费"))) {
			return false;
		}
		if(	javaTrim(FormName.zjqtfy)=="") {
			alert("请输入[增减其它费金额]！");
			FormName.zjqtfy.focus();
			return false;
		}
		if(!(isFloat(FormName.zjqtfy, "增减其它费金额"))) {
			return false;
		}
		if(	javaTrim(FormName.zjcxhdje)=="") {
			alert("请输入[增减计入活动金额]！");
			FormName.zjcxhdje.focus();
			return false;
		}
		if(!(isFloat(FormName.zjcxhdje, "增减计入活动金额"))) {
			return false;
		}
	}
	else{
		for (var i=0;i< <%=row1%> ;i++ )
		{
			f_jsjg1(FormName,i);

			if(	javaTrim(FormName.zjsl[i])=="") {
				alert("请输入[增减数量]！");
				FormName.zjsl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zjsl[i], "增减数量"))) {
				return false;
			}
			if (FormName.zjsl[i].value=="0")
			{
				alert("请输入[增减数量]！");
				FormName.zjsl[i].select();
				return false;
			}
			if ( (parseFloat(FormName.zjsl[i].value) + parseFloat(FormName.zjhsl[i].value) ) <0 )
			{
				alert("[减项数量]不能超过订货数量["+FormName.zjhsl[i].value+"]！");
				FormName.zjsl[i].select();
				return false;
			}

			if(	javaTrim(FormName.zqzjje[i])=="") {
				alert("请输入[折前增减材料费]！");
				FormName.zqzjje[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqzjje[i], "折前增减材料费"))) {
				return false;
			}
			if(	javaTrim(FormName.zjje[i])=="") {
				alert("请输入[折扣增减材料费]！");
				FormName.zjje[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zjje[i], "折扣增减材料费"))) {
				return false;
			}

			if(	javaTrim(FormName.zjycf[i])=="") {
				alert("请输入[增减远程费]！");
				FormName.zjycf[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zjycf[i], "增减远程费"))) {
				return false;
			}
			if(	javaTrim(FormName.zjqtfy[i])=="") {
				alert("请输入[增减其它费金额]！");
				FormName.zjqtfy[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zjqtfy[i], "增减其它费金额"))) {
				return false;
			}
			if(	javaTrim(FormName.zjcxhdje[i])=="") {
				alert("请输入[增减计入活动金额]！");
				FormName.zjcxhdje[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zjcxhdje[i], "增减计入活动金额"))) {
				return false;
			}

		}
	}

	
	
	if (<%=row%>==1)
	{
		f_jsjg(FormName,1);

		if(	javaTrim(FormName.zqdj)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折前实销单价]！");
			FormName.zqdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zqdj, "折前实销单价"))) {
			return false;
		}

		if(	javaTrim(FormName.dpzk)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折扣率]！");
			FormName.dpzk.focus();
			return false;
		}
		if(!(isFloat(FormName.dpzk, "折扣率"))) {
			return false;
		}
		if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[折扣率]应该在0和10之间！");
			FormName.dpzk.select();
			return false;
		}

		if(	javaTrim(FormName.dj)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折后实销单价]！");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "折后实销单价"))) {
			return false;
		}

		if(	javaTrim(FormName.sl)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[订货数量]！");
			FormName.sl.focus();
			return false;
		}
		if(!(isFloat(FormName.sl, "订货数量"))) {
			return false;
		}
		if (parseFloat(FormName.sl.value)<=0)
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[订货数量]不能<=0！");
			FormName.sl.select();
			return false;
		}

		if(	javaTrim(FormName.zqje)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折前材料费]！");
			FormName.zqje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqje, "折前材料费"))) {
			return false;
		}
		if(	javaTrim(FormName.je)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折后材料费]！");
			FormName.je.focus();
			return false;
		}
		if(!(isFloat(FormName.je, "折后材料费"))) {
			return false;
		}

		if(!(isFloat(FormName.ycf, "远程费"))) {
			return false;
		}

		if(	javaTrim(FormName.qtfy)=="") 
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！请选择[其它费用]！");
			FormName.qtfy.select();
			return false;
		}

		if (FormName.qtfy.value!="W")
		{
			if(	javaTrim(FormName.qtfyje)=="") {
				alert("主材编码["+FormName.zcbm.value+"]出错！请输入[其它费金额]！");
				FormName.qtfyje.focus();
				return false;
			}
			if(!(isFloat(FormName.qtfyje, "其它费金额"))) {
				return false;
			}
			if (FormName.qtfyje.value=="0")
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！[其它费金额]不能为0！");
				FormName.qtfyje.select();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.qtfyje)!="" && FormName.qtfyje.value!="0") 
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！没有收[其它费]！");
				FormName.qtfyje.select();
				return false;
			}
		}

		if (FormName.cxhdbz.value=="Y")
		{
			if(	javaTrim(FormName.cxhdbl)=="") {
				alert("主材编码["+FormName.zcbm.value+"]出错！请输入[计入促销活动比率]！");
				FormName.cxhdbl.focus();
				return false;
			}
			if(!(isFloat(FormName.cxhdbl, "计入促销活动比率"))) {
				return false;
			}
			if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>100)
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！[计入促销活动比率]应在0％和100％之间！");
				FormName.cxhdbl.select();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.cxhdbl)!="" && FormName.cxhdbl.value!="0") {
				alert("主材编码["+FormName.zcbm.value+"]出错！不参加促销活动，[计入促销活动比率]应为0！");
				FormName.cxhdbl.select();
				return false;
			}
			if(	javaTrim(FormName.cxhdje)!="" && FormName.cxhdje.value!="0") {
				alert("主材编码["+FormName.zcbm.value+"]出错！不参加促销活动，[计入促销活动金额]应为0！");
				FormName.cxhdbl.select();
				return false;
			}
		}
		if(	javaTrim(FormName.sfzp)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请选择[是否赠品]！");
			FormName.sfzp.focus();
			return false;
		}

		if (FormName.sfzp.value=="Y")
		{
			if (parseFloat(FormName.dj.value)!=0)
			{
				alert("错误！赠品【折后实销单价】应为0");
				FormName.dj.select();
				return false;
			}
			if(	javaTrim(FormName.zsdj)=="") {
				alert("请输入[赠送单价]！");
				FormName.zsdj.focus();
				return false;
			}
			if(!(isFloat(FormName.zsdj, "赠送单价"))) {
				return false;
			}
			if (parseFloat(FormName.zsdj.value)==0)
			{
				alert("错误！赠品【赠送单价】不能为0");
				FormName.zsdj.select();
				return false;
			}
		}
		else{
			if (parseFloat(FormName.dj.value)==0)
			{
				alert("错误！非赠品【折后实销单价】不能为0");
				FormName.dj.select();
				return false;
			}

			if(	javaTrim(FormName.zsdj)=="") {
				alert("请输入[赠送单价]！");
				FormName.zsdj.focus();
				return false;
			}
			if(!(isFloat(FormName.zsdj, "赠送单价"))) {
				return false;
			}
			if (parseFloat(FormName.zsdj.value)!=0)
			{
				alert("错误！非赠品【赠送单价】应为0");
				FormName.zsdj.select();
				return false;
			}
		}
	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{

			f_jsjg(FormName,i);

			if(	javaTrim(FormName.zqdj[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[折前实销单价]！");
				FormName.zqdj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqdj[i], "折前实销单价"))) {
				return false;
			}

			if(	javaTrim(FormName.dpzk[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[折扣率]！");
				FormName.dpzk[i].focus();
				return false;
			}
			if(!(isFloat(FormName.dpzk[i], "折扣率"))) {
				return false;
			}
			if (FormName.dpzk[i].value<0 || FormName.dpzk[i].value>10)
			{
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！[折扣率]应该在0和10之间！");
				FormName.dpzk[i].select();
				return false;
			}

			if(	javaTrim(FormName.dj[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[折后实销单价]！");
				FormName.dj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.dj[i], "折后实销单价"))) {
				return false;
			}

			if(	javaTrim(FormName.sl[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[订货数量]！");
				FormName.sl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.sl[i], "订货数量"))) {
				return false;
			}
			if (parseFloat(FormName.sl[i].value)<=0)
			{
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！[订货数量]不能<=0！");
				FormName.sl[i].select();
				return false;
			}

			if(	javaTrim(FormName.zqje[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[折前材料费]！");
				FormName.zqje[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqje[i], "折前材料费"))) {
				return false;
			}
			if(	javaTrim(FormName.je[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[折后材料费]！");
				FormName.je[i].focus();
				return false;
			}
			if(!(isFloat(FormName.je[i], "折后材料费"))) {
				return false;
			}

			if(!(isFloat(FormName.ycf[i], "远程费"))) {
				return false;
			}

			if(	javaTrim(FormName.qtfy[i])=="") 
			{
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请选择[其它费用]！");
				FormName.qtfy[i].select();
				return false;
			}

			if (FormName.qtfy[i].value!="W")
			{
				if(	javaTrim(FormName.qtfyje[i])=="") {
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[其它费金额]！");
					FormName.qtfyje[i].focus();
					return false;
				}
				if(!(isFloat(FormName.qtfyje[i], "其它费金额"))) {
					return false;
				}
				if (FormName.qtfyje[i].value=="0")
				{
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！[其它费金额]不能为0！");
					FormName.qtfyje[i].select();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.qtfyje[i])!="" && FormName.qtfyje[i].value!="0") 
				{
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！没有收[其它费]！");
					FormName.qtfyje[i].select();
					return false;
				}
			}

			if (FormName.cxhdbz[i].value=="Y")
			{
				if(	javaTrim(FormName.cxhdbl[i])=="") {
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请输入[计入促销活动比率]！");
					FormName.cxhdbl.focus();
					return false;
				}
				if(!(isFloat(FormName.cxhdbl[i], "计入促销活动比率"))) {
					return false;
				}
				if (FormName.cxhdbl[i].value<=0 || FormName.cxhdbl[i].value>100)
				{
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！[计入促销活动比率]应在0％和100％之间！");
					FormName.cxhdbl[i].select();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.cxhdbl[i])!="" && FormName.cxhdbl[i].value!="0") {
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！不参加促销活动，[计入促销活动比率]应为0！");
					FormName.cxhdbl[i].select();
					return false;
				}
				if(	javaTrim(FormName.cxhdje[i])!="" && FormName.cxhdje[i].value!="0") {
					alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！不参加促销活动，[计入促销活动金额]应为0！");
					FormName.cxhdbl[i].select();
					return false;
				}
			}
			if(	javaTrim(FormName.sfzp[i])=="") {
				alert("主材编码["+FormName.zcbm[<%=row1%>+i].value+"]出错！请选择[是否赠品]！");
				FormName.sfzp[i].focus();
				return false;
			}

			if (FormName.sfzp[i].value=="Y")
			{
				if (parseFloat(FormName.dj[i].value)!=0)
				{
					alert("错误！赠品【折后实销单价】应为0");
					FormName.dj[i].select();
					return false;
				}
				if(	javaTrim(FormName.zsdj[i])=="") {
					alert("请输入[赠送单价]！");
					FormName.zsdj[i].focus();
					return false;
				}
				if(!(isFloat(FormName.zsdj[i], "赠送单价"))) {
					return false;
				}
				if (parseFloat(FormName.zsdj[i].value)==0)
				{
					alert("错误！赠品【赠送单价】不能为0");
					FormName.zsdj[i].select();
					return false;
				}
			}
			else{
				if (parseFloat(FormName.dj[i].value)==0)
				{
					alert("错误！非赠品【折后实销单价】不能为0");
					FormName.dj[i].select();
					return false;
				}
				if(	javaTrim(FormName.zsdj[i])=="") {
					alert("请输入[赠送单价]！");
					FormName.zsdj[i].focus();
					return false;
				}
				if(!(isFloat(FormName.zsdj[i], "赠送单价"))) {
					return false;
				}
				if (parseFloat(FormName.zsdj[i].value)!=0)
				{
					alert("错误！非赠品【赠送单价】应为0");
					FormName.zsdj[i].select();
					return false;
				}
			}
		}
	}


	FormName.action="SaveEditAllJc_zcddmx.jsp";
	FormName.submit();
	return true;
}


var mark=1;
function f_checkAll(FormName)//转换字符串
{
	var i = 0;
	if (<%=allrow%>==1){
		if (mark==0)
		{
			FormName.xh.checked =false
		}
		else{
			FormName.xh.checked =true
		}
	}
	else if (<%=allrow%> >1){ 
		for (i=0;i< <%=allrow%>;i++ ){
			if (mark==0)
			{
				FormName.xh[i].checked =false
			}
			else{
				FormName.xh[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}

function f_delete(FormName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
		var i = 0;
		if (<%=allrow%>==1){
			if( FormName.xh.checked ){
				choo=1;
			}
		} 
		else if (<%=allrow%>>1){ 
			for (i=0;i< <%=allrow%>;i++ ){
				if( FormName.xh[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择要删除的数据");
			return false;
		}
		else{
			FormName.action="DeleteJc_zcddmx.jsp";
			FormName.submit();
			return true;
		}
	}
} 

//-->
</SCRIPT>
