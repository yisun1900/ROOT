<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="hygl" scope="page" class="hygl.Hygl"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls_sql=null;
String wheresql=" WHERE (dm_thjl.thdw=sq_dwxx.dwbh) ";
int curPage=0;
String pageStr=request.getParameter("curPage");

if (pageStr!=null)//第x次运行
{
	//要求显示第几页
	curPage=Integer.parseInt(pageStr);
	String chooseitem = request.getParameter("chooseitem");
	if ((chooseitem!=null)&&(!(chooseitem.equals(""))))//执行删除操作
	{
		Connection conn=null;    //得到连接
		PreparedStatement ps=null;
		ResultSet rs=null;
		PreparedStatement ps1=null;
		ResultSet rs1=null;
		PreparedStatement ps2=null;
		ResultSet rs2=null;
		String sql="";

		String thjlh="",cpbm="",dwbh="",khbh="",thrq=null;
		double thj=0;
		double sxj=0;
		String thlx=null;
		String thdw=null;
		String ywxh=null;
		String ckbm=null;
		String hjbm=null;
		String xsdwbh=null;
		String xsckbm=null;
		String xshjbm=null;

		try{
			conn=cf.getConnection();    //得到连接
			conn.setAutoCommit(false);

			//从销售记录表中取出单位编号、产品编码、客户编号、实销价、业务序号、销售日期
			sql="select thdw,thbz,thjlh,xsdw,cpbm,khbh,thj,TO_CHAR(thrq,'YYYY-MM-DD') thrq,ywxh,sxj,ckbm,hjbm";
			sql+="  from dm_thjl where "+chooseitem;
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			while(rs1.next()){
				thdw=rs1.getString("thdw");
				thlx=rs1.getString("thbz");
				thjlh=rs1.getString("thjlh");
				dwbh=rs1.getString("xsdw");
				cpbm=rs1.getString("cpbm");
				khbh=rs1.getString("khbh");
				thj=rs1.getDouble("thj");
				thrq=rs1.getString("thrq");
				ywxh=rs1.getString("ywxh");
				sxj=rs1.getDouble("sxj");
				ckbm=rs1.getString("ckbm");
				hjbm=rs1.getString("hjbm");

				sql="select cpbm FROM cp_cpxx ";
				sql+=" WHERE cpbm='"+cpbm+"' and wlzt='00' ";
				sql+=" and szdw='"+thdw+"' and ckbm='"+ckbm+"' and hjbm='"+hjbm+"'";
				ps=conn.prepareStatement(sql);  
				rs=ps.executeQuery();
				if (rs.next()){
				}
				else{
					conn.rollback();
					out.println("<BR>SQL="+sql);
					out.println("<BR>错误！无产品编码或货物已改变状态，产品编码="+cpbm);
					return;
				}
				rs.close();
				ps.close();


				//取销售单位仓库信息
				sql="select dwbh,ckbm,hjbm FROM dm_xsjl ";
				sql+=" WHERE cpbm='"+cpbm+"' and ywxh='"+ywxh+"'";
				ps=conn.prepareStatement(sql);  
				rs=ps.executeQuery();
				if (rs.next()){
					xsdwbh=rs.getString("dwbh");
					xsckbm=rs.getString("ckbm");
					xshjbm=rs.getString("hjbm");
				}
				rs.close();
				ps.close();
				

				//修改产品信息
				if (thlx.equals("0"))//0本店；
				{
					sql="update cp_cpxx set thjlh=null,wlzt='05',thrq=null,thj=null";
					sql+=" where cpbm='"+cpbm+"'";
				}
				else{//1异店
					sql="update cp_cpxx set thjlh=null,wlzt='05',thrq=null,thj=null";
					sql+=" ,szdw='"+xsdwbh+"',ckbm='"+xsckbm+"',hjbm='"+xshjbm+"'";
					sql+=" where cpbm='"+cpbm+"'";
				}
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				//马学中 2003.9.24 新增，原因：要将销售的产品放到cp_cpxx1中
				//将删除的退货的产品信息从cp_cpxx、cp_cpstxx表中移到cp_cpxx1和cp_cpstxx1中
				sql  =  " insert into cp_cpxx1";
				sql +=  " select* ";
				sql +=  " from cp_cpxx where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				sql  =  " insert into cp_cpstxx1";
				sql +=  " select * from cp_cpstxx where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				sql =  " delete from cp_cpstxx where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				sql =  " delete from cp_cpxx where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();
				//结束销售产品信息的移动

				String zp_ckbm="",zpbm="";

				int xh=0;
				String zplx=null;
				//根据产品编码从附属赠品表中查询附属赠品信息
				sql="select xh,zpbm,zplx,ckbm from dm_zpth ";
				sql+="  where  thjlh='"+thjlh+"' and cpbm='"+cpbm+"'";
//				out.println("<BR>"+sql);
				ps2=conn.prepareStatement(sql);
				rs2=ps2.executeQuery();
				while(rs2.next()){
					xh=rs2.getInt(1);
					zpbm=rs2.getString(2);
					zplx=rs2.getString(3);
					zp_ckbm=rs2.getString(4);

					 //修改赠品库存，库存数量减1，
					 sql="update cp_zpkc set  sl=sl-1 ";
					 sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
//					out.println("<BR>"+sql);
					 ps=conn.prepareStatement(sql);  
					 ps.executeUpdate();
					 ps.close();
					 //删除赠品库，库存数量为0记录，
					 sql="delete from cp_zpkc ";
					 sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2' and sl=0";   
					 ps=conn.prepareStatement(sql);  
					 ps.executeUpdate();
					 ps.close();
				
					if (zplx.equals("1"))
					{
						//修改产品信息
						sql="update cp_cpxx set wlzt='05',thjlh=null,thrq=null,thj=null";
						sql+=" where cpbm='"+zpbm+"'";
						ps=conn.prepareStatement(sql);
						ps.executeUpdate();
						ps.close();

						//马学中 2003.9.24 新增，原因：要将销售的产品放到cp_cpxx1中
						//处理由成品专成的赠品信息，将销售的产品信息从cp_cpxx、cp_cpstxx表中移到cp_cpxx1和cp_cpstxx1中
						sql  =  " insert into cp_cpxx1 ";
						sql +=  " select * ";
						sql +=  " from cp_cpxx where  cpbm=? ";
						ps=conn.prepareStatement(sql);  
						ps.setString(1,zpbm);
						ps.executeUpdate();
						ps.close();

						sql  =  " insert into cp_cpstxx1 ";
						sql +=  " select * from cp_cpstxx where  cpbm=? ";
						ps=conn.prepareStatement(sql);  
						ps.setString(1,zpbm);
						ps.executeUpdate();
						ps.close();

						sql =  " delete from cp_cpstxx where  cpbm=? ";
						ps=conn.prepareStatement(sql);  
						ps.setString(1,zpbm);
						ps.executeUpdate();
						ps.close();

						sql =  " delete from cp_cpxx where  cpbm=? ";
						ps=conn.prepareStatement(sql);  
						ps.setString(1,zpbm);
						ps.executeUpdate();
						ps.close();
						//结束销售产品信息的移动
					}
				}
				rs2.close();
				ps2.close();

				//删除赠品销售记录
				sql="delete from dm_zpth where  thjlh='"+thjlh+"' and cpbm='"+cpbm+"'";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
			
				//修改会员信息和会员消费记录
				if(khbh!=null){
					hygl.deleteTh(conn,sxj,khbh,ywxh,out);
				}//end if(khbh.length()<1)
			}
			rs1.close();
			ps1.close();

			ls_sql="delete from dm_thjl where "+chooseitem;
			pageObject.executeSql(conn,ls_sql);

			conn.commit();
		}
		catch(Exception e){
			conn.rollback();
			out.println("<BR>执行pageObject.executeSql(conn,ls_sql)出错："+e);
			out.println("<BR>ls_sql="+sql);
		}
		finally{
			try{
				 conn.setAutoCommit(true);  
				 if (rs!=null) rs.close();
				 if (ps!= null) ps.close();
				 if (rs1!=null) rs1.close();
				 if (ps1!= null) ps1.close();
				 if (rs2!=null) rs2.close();
				 if (ps2!= null) ps2.close();
				 if (conn != null) cf.close(conn);
			}catch (Exception e){
				  out.println("数据库操作失败："+e.getMessage());
			}
		}
		pageObject.afterDelete();
	}
}
else//第一次运行,需要查询
{
	curPage=1;
	String thjlh=null;
	String cpbm=null;
	String thdw=null;
	String thj=null;
	String thyy=null;
	String thbz=null;
	String thrq=null;
	String czy=null;
	String ywxh=null;
	String xsdw=null;
	String sxj=null;
	String khbh=null;
	String shbz=null;
	String shr=null;
	String shrq=null;
	String khlx=null;
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		if (!(khlx.equals("")))	wheresql+="  and (khlx='"+khlx+"')";
	}
	String sfjs=null;
	thjlh=request.getParameter("thjlh");
	if (thjlh!=null)
	{
		thjlh=cf.GB2Uni(thjlh);
		if (!(thjlh.equals("")))	wheresql+="  and (thjlh='"+thjlh+"')";
	}
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+="  and (cpbm='"+cpbm+"')";
	}
	thdw=request.getParameter("thdw");
	if (thdw!=null)
	{
		thdw=cf.GB2Uni(thdw);
		if (!(thdw.equals("")))	wheresql+="  and (thdw='"+thdw+"')";
	}
	thj=request.getParameter("thj");
	if (thj!=null)
	{
		thj=thj.trim();
		if (!(thj.equals("")))	wheresql+=" and  (thj="+thj+") ";
	}
	thyy=request.getParameter("thyy");
	if (thyy!=null)
	{
		thyy=cf.GB2Uni(thyy);
		if (!(thyy.equals("")))	wheresql+=" and  (thyy='"+thyy+"')";
	}
	thbz=request.getParameter("thbz");
	if (thbz!=null)
	{
		thbz=cf.GB2Uni(thbz);
		if (!(thbz.equals("")))	wheresql+="  and (thbz='"+thbz+"')";
	}
	thrq=request.getParameter("thrq");
	if (thrq!=null)
	{
		thrq=thrq.trim();
		if (!(thrq.equals("")))	wheresql+="  and (thrq>=TO_DATE('"+thrq+"','YYYY/MM/DD'))";
	}
	thrq=request.getParameter("thrq2");
	if (thrq!=null)
	{
		thrq=thrq.trim();
		if (!(thrq.equals("")))	wheresql+="  and (thrq<=TO_DATE('"+thrq+"','YYYY/MM/DD'))";
	}
	czy=request.getParameter("czy");
	if (czy!=null)
	{
		czy=cf.GB2Uni(czy);
		if (!(czy.equals("")))	wheresql+="  and (czy='"+czy+"')";
	}
	ywxh=request.getParameter("ywxh");
	if (ywxh!=null)
	{
		ywxh=cf.GB2Uni(ywxh);
		if (!(ywxh.equals("")))	wheresql+="  and (ywxh='"+ywxh+"')";
	}
	xsdw=request.getParameter("xsdw");
	if (xsdw!=null)
	{
		xsdw=cf.GB2Uni(xsdw);
		if (!(xsdw.equals("")))	wheresql+="  and (xsdw='"+xsdw+"')";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj="+sxj+") ";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+="  and (shbz='"+shbz+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+="  and (shr='"+shr+"')";
	}
	shrq=request.getParameter("shrq");
	if (shrq!=null)
	{
		shrq=shrq.trim();
		if (!(shrq.equals("")))	wheresql+="  and (shrq=TO_DATE('"+shrq+"','YYYY/MM/DD'))";
	}
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=sfjs.trim();
		if (!(sfjs.equals("")))	wheresql+=" and (sfjs="+sfjs+") ";
	}
	ls_sql="SELECT thjlh,cpbm,dwmc,thj,DECODE(thbz,0,'本店退货',1,'异店换货',2,'异店退货'),thrq,czy,DECODE(sfjs,0,'未结算',1,'结算')  ";
	ls_sql+=" FROM dm_thjl,sq_dwxx  ";
    ls_sql+=wheresql;
	ls_sql+=" order by thjlh,cpbm";
//	out.println(ls_sql);
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("Dm_thjlList.jsp","SelectDm_thjl.jsp","ViewDm_thjl.jsp","");
/*
//设置显示列
	String[] disColName={"thjlh","cpbm","thdw","thj","thbz","thrq","czy"};
	pageObject.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"thjlh","cpbm"};
	pageObject.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_thjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObject.setButton(buttonName,buttonLink,buttonNew);
	}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%" >&nbsp;</td>
	<td  width="12%" >退货记录号</td>
	<td  width="12%" >产品编码</td>
	<td  width="16%" >退货单位</td>
	<td  width="10%" >退货金额</td>
	<td  width="10%" >退货类型</td>
	<td  width="12%" >退货日期</td>
	<td  width="8%" >操作员</td>
	<td  width="10%" >结算标志</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>