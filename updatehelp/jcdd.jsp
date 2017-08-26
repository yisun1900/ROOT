<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//木门
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select yddbh,'1','1',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'','','',pdgc,pdgcmc,gys,ppmc,htje,htrq";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04：签订合同
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select yddbh||'+'||zjxxh,'1','2',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'','','',pdgc,pdgcmc,gys,ppmc,zjxze,zjxfssj";
	ls_sql+=" from jc_mmzjx";
	ls_sql+=" where jc_mmzjx.clzt not in('00')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select yddbh,'1','3',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'','','',pdgc,pdgcmc,gys,ppmc,-1*zjhze,tdsj";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where jc_mmydd.clzt='99' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//橱柜
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh,'2','1',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,cgsjs,'','',pdgc,pdgcmc,gys,ppmc,htze,qhtsj";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13：签订合同
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh||'+'||zjxxh,'2','2',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,cgsjs,'','',pdgc,pdgcmc,gys,ppmc,zjxze,zjxfssj";
	ls_sql+=" from jc_cgzjx";
	ls_sql+=" where jc_cgzjx.clzt not in('00')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh,'2','3',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,cgsjs,'','',pdgc,pdgcmc,gys,ppmc,-1*zjhze,tdsj";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where jc_cgdd.clzt='99' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//家具
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh,'3','1',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,'','',pdgc,pdgcmc,jjgys,jjppmc,htze,qhtsj";
	ls_sql+=" from jc_jjdd";
	ls_sql+=" where jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13：签订合同
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select zjxxh,'3','2',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,'','',pdgc,pdgcmc,jjgys,jjppmc,zjxze,zjxfssj";
	ls_sql+=" from jc_jjzjx";
	ls_sql+=" where jc_jjzjx.clzt not in('00')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh,'3','3',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,'','',pdgc,pdgcmc,jjgys,jjppmc,-1*zjhze,tdsj";
	ls_sql+=" from jc_jjdd";
	ls_sql+=" where jc_jjdd.clzt='99' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh,'4','1',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,hkze,qhtsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select zjxbh,'4','2',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,zjxze,zjxfssj";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where jc_zczjx.clzt not in('00')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,je,fssj)";
	ls_sql+=" select ddbh,'4','3',khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,-1*(hkze+zjhze),tdsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt='99' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e+ls_sql);
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