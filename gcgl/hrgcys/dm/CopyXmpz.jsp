<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
String gcysbbhnew=cf.GB2Uni(request.getParameter("gcysbbhnew"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql =" insert into dm_heysxmpz (gcysbbh,gcysxmbm,gcysxmmc,yszxsl,ys1,byx1,ysbztp1,ysbzsm1,ys2,byx2,ysbztp2,ysbzsm2,ys3,byx3,ysbztp3,ysbzsm3,ys4,byx4,ysbztp4,ysbzsm4,ys5,byx5,ysbztp5,ysbzsm5,ys6,byx6,ysbztp6,ysbzsm6,ys7,byx7,ysbztp7,ysbzsm7,ys8,byx8,ysbztp8,ysbzsm8,ys9,byx9,ysbztp9,ysbzsm9,ys10,byx10,ysbztp10,ysbzsm10,ys11,byx11,ysbztp11,ysbzsm11,ys12,byx12,ysbztp12,ysbzsm12,ys13,byx13,ysbztp13,ysbzsm13,ys14,byx14,ysbztp14,ysbzsm14,ys15,byx15,ysbztp15,ysbzsm15,ys16,byx16,ysbztp16,ysbzsm16,ys17,byx17,ysbztp17,ysbzsm17,ys18,byx18,ysbztp18,ysbzsm18,ys19,byx19,ysbztp19,ysbzsm19,ys20,byx20,ysbztp20,ysbzsm20,ys21,byx21,ysbztp21,ysbzsm21,ys22,byx22,ysbztp22,ysbzsm22,ys23,byx23,ysbztp23,ysbzsm23,ys24,byx24,ysbztp24,ysbzsm24,ys25,byx25,ysbztp25,ysbzsm25,ys26,byx26,ysbztp26,ysbzsm26,ys27,byx27,ysbztp27,ysbzsm27,ys28,byx28,ysbztp28,ysbzsm28,ys29,byx29,ysbztp29,ysbzsm29,ys30,byx30,ysbztp30,ysbzsm30,ys31,byx31,ysbztp31,ysbzsm31,ys32,byx32,ysbztp32,ysbzsm32,ys33,byx33,ysbztp33,ysbzsm33,ys34,byx34,ysbztp34,ysbzsm34,ys35,byx35,ysbztp35,ysbzsm35,ys36,byx36,ysbztp36,ysbzsm36,ys37,byx37,ysbztp37,ysbzsm37,ys38,byx38,ysbztp38,ysbzsm38,ys39,byx39,ysbztp39,ysbzsm39,ys40,byx40,ysbztp40,ysbzsm40,ys41,byx41,ysbztp41,ysbzsm41,ys42,byx42,ysbztp42,ysbzsm42,ys43,byx43,ysbztp43,ysbzsm43,ys44,byx44,ysbztp44,ysbzsm44,ys45,byx45,ysbztp45,ysbzsm45,ys46,byx46,ysbztp46,ysbzsm46,ys47,byx47,ysbztp47,ysbzsm47,ys48,byx48,ysbztp48,ysbzsm48,ys49,byx49,ysbztp49,ysbzsm49,ys50,byx50,ysbztp50,ysbzsm50)";
	ls_sql+=" select                         ?,gcysxmbm,gcysxmmc,yszxsl,ys1,byx1,ysbztp1,ysbzsm1,ys2,byx2,ysbztp2,ysbzsm2,ys3,byx3,ysbztp3,ysbzsm3,ys4,byx4,ysbztp4,ysbzsm4,ys5,byx5,ysbztp5,ysbzsm5,ys6,byx6,ysbztp6,ysbzsm6,ys7,byx7,ysbztp7,ysbzsm7,ys8,byx8,ysbztp8,ysbzsm8,ys9,byx9,ysbztp9,ysbzsm9,ys10,byx10,ysbztp10,ysbzsm10,ys11,byx11,ysbztp11,ysbzsm11,ys12,byx12,ysbztp12,ysbzsm12,ys13,byx13,ysbztp13,ysbzsm13,ys14,byx14,ysbztp14,ysbzsm14,ys15,byx15,ysbztp15,ysbzsm15,ys16,byx16,ysbztp16,ysbzsm16,ys17,byx17,ysbztp17,ysbzsm17,ys18,byx18,ysbztp18,ysbzsm18,ys19,byx19,ysbztp19,ysbzsm19,ys20,byx20,ysbztp20,ysbzsm20,ys21,byx21,ysbztp21,ysbzsm21,ys22,byx22,ysbztp22,ysbzsm22,ys23,byx23,ysbztp23,ysbzsm23,ys24,byx24,ysbztp24,ysbzsm24,ys25,byx25,ysbztp25,ysbzsm25,ys26,byx26,ysbztp26,ysbzsm26,ys27,byx27,ysbztp27,ysbzsm27,ys28,byx28,ysbztp28,ysbzsm28,ys29,byx29,ysbztp29,ysbzsm29,ys30,byx30,ysbztp30,ysbzsm30,ys31,byx31,ysbztp31,ysbzsm31,ys32,byx32,ysbztp32,ysbzsm32,ys33,byx33,ysbztp33,ysbzsm33,ys34,byx34,ysbztp34,ysbzsm34,ys35,byx35,ysbztp35,ysbzsm35,ys36,byx36,ysbztp36,ysbzsm36,ys37,byx37,ysbztp37,ysbzsm37,ys38,byx38,ysbztp38,ysbzsm38,ys39,byx39,ysbztp39,ysbzsm39,ys40,byx40,ysbztp40,ysbzsm40,ys41,byx41,ysbztp41,ysbzsm41,ys42,byx42,ysbztp42,ysbzsm42,ys43,byx43,ysbztp43,ysbzsm43,ys44,byx44,ysbztp44,ysbzsm44,ys45,byx45,ysbztp45,ysbzsm45,ys46,byx46,ysbztp46,ysbzsm46,ys47,byx47,ysbztp47,ysbzsm47,ys48,byx48,ysbztp48,ysbzsm48,ys49,byx49,ysbztp49,ysbzsm49,ys50,byx50,ysbztp50,ysbzsm50";
	ls_sql+=" from dm_heysxmpz";
	ls_sql+=" where gcysbbh='"+gcysbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysbbhnew);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("复制成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>