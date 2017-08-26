<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<%  
String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String hykh = request.getParameter("hykh");
String cpbm = request.getParameter("cpbm");
String dwbh = request.getParameter("dwbh");
String wlzt=null;
String pmbm=null;
String plmc=null;
String jldm=null;
String zsh=null;
int bqj=0;
int sxj=0;
double jlzl=0;
double lsdrjj=0;
double yscbj=0;//调节成本价

String bsczbm=null;
String bsflbm=null;
String jlflbm=null;
String hyjbbh=null;
double bqjzkl=0;
double sxjzkl=0;

String hyxm=null;
String hyjb=null;
String sfzf=null;
String hybh=null;

try {
	conn=cf.getConnection();    //得到连接

	if (cpbm!=null)
	{
		sql="SELECT hyjb ";
		sql+=" FROM hy_hyxxb";
		sql+=" WHERE hy_hyxxb.hykh='"+hykh+"'"; 
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			hyjbbh=rs.getString(1);
		}
		else{
%>
			<SCRIPT language=javascript >
			<!--
				alert("不存在的水质分析卡号！");
				parent.main.xhd.hykh.select() ;   
			//-->
			</SCRIPT>
<%
			return;
		}
		rs.close();
		ps.close();

		ls_sql="select wlzt,bqj,yscbj,jlzl,jldm,cp_cpxx.pmbm,plmc,zsh,cp_cpxx.jldm,cp_cpxx.bsczbm";
		ls_sql+=" from cp_cpxx,xt_plbm";
		ls_sql+=" where  cp_cpxx.plbm=xt_plbm.plbm and cpbm='"+cpbm+"' and szdw='"+dwbh+"'";
//		out.println(ls_sql);
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next()){  
			wlzt=rs.getString("wlzt");
			pmbm=rs.getString("pmbm");
			plmc=rs.getString("plmc");
			jldm=rs.getString("jldm");
			zsh=cf.fillNull(rs.getString("zsh"));
			bqj=(int)rs.getDouble("bqj");
			yscbj=rs.getDouble("yscbj");
			jlzl=rs.getDouble("jlzl");
			bsczbm=rs.getString("bsczbm");


			sql="SELECT bsflbm";
			sql+=" FROM xt_bsczbm ";
			sql+=" WHERE  bsczbm='"+bsczbm+"'";
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if(rs1.next()){
				bsflbm=rs1.getString(1);
			}
			rs1.close();
			ps1.close();

			sql="SELECT jlflbm";
			sql+=" FROM yl_jldmb ";
			sql+=" WHERE  yldm='"+jldm+"'";
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if(rs1.next()){
				jlflbm=rs1.getString(1);
			}
			rs1.close();
			ps1.close();


			sql="SELECT bqjzkl,sxjzkl";
			sql+=" FROM hy_hyzkb ";
			sql+=" WHERE  hyjbbh='"+hyjbbh+"' and bsflbm='"+bsflbm+"' and jlflbm='"+jlflbm+"'";
//			out.println(sql);
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if(rs1.next()){
				bqjzkl=rs1.getDouble("bqjzkl");
				sxjzkl=rs1.getDouble("sxjzkl");
			}
			else{
				if (hyjbbh!=null)
				{
					%>
					<SCRIPT language=javascript >
					<!--
						alert("错误！产品条码<%=cpbm%>在[会员折扣表]未找到对应参数<%=hyjbbh%>");
						parent.main.xhd.hykh.select() ;   
					//-->
					</SCRIPT>
					<%
					return;
				}
			}
			rs1.close();
			ps1.close();

//			out.println(sxjzkl);

			bqj=(int)(yscbj*bqjzkl);
			sxj=(int)(yscbj*sxjzkl);


			if (!wlzt.equals("00"))
			{
				%>
				<SCRIPT language=javascript >
				<!--
					alert("此件货物不在成品库！");
					parent.main.xhd.cpbm.value="" ;
					parent.main.xhd.cpbm.select() ;   
				//-->
				</SCRIPT>
				<%
			}
			else{
				if (pmbm.equals("P")){
					%>
					<SCRIPT language=javascript >
					<!--
						parent.main.xhd.bqj.value="<%=bqj%>";   
						parent.main.xhd.jlzl.value="<%=jlzl%>";   
						parent.main.xhd.plmc.value="<%=plmc%>";
						parent.main.xhd.zsh.value="<%=zsh%>";
						parent.main.xhd.sxj.value="<%=sxj%>";   

						alert("提示！！！这件货是吊坠，需要输入赠品");
						parent.main.xhd.sxj.select() ;   
					//-->
					</SCRIPT>
					<%
				}
				else{
					%>
					<SCRIPT language=javascript >
					<!--
						parent.main.xhd.bqj.value="<%=bqj%>";   
						parent.main.xhd.jlzl.value="<%=jlzl%>";   
						parent.main.xhd.plmc.value="<%=plmc%>";
                        parent.main.xhd.zsh.value="<%=zsh%>"; 
						parent.main.xhd.sxj.value="<%=sxj%>";   
						parent.main.xhd.sxj.select() ;   
					//-->
					</SCRIPT>
					<%
				}
			}
		}
		else{
%>
			<SCRIPT language=javascript >
			<!--
				alert("产品条码不存在！");
				parent.main.xhd.cpbm.value="" ;
				parent.main.xhd.cpbm.select() ;   
			//-->
			</SCRIPT>
<%
		}
		rs.close();
		ps.close();
	}
	else if (hykh!=null)
	{
		sql="SELECT hyxm,hy_hyjbb.hyjb,sfzf,hybh,hy_hyxxb.hyjb hyjbbh ";
		sql+=" FROM hy_hyxxb,hy_hyjbb ";
		sql+=" WHERE hy_hyxxb.hykh='"+hykh+"' AND hy_hyxxb.hyjb=hy_hyjbb.hyjbbh(+)"; 
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			hyxm=rs.getString(1);
			hyjb=rs.getString(2);
			sfzf=rs.getString(3);
			hybh=rs.getString(4);
			hyjbbh=rs.getString(5);
		}
		else{
%>
			<SCRIPT language=javascript >
			<!--
				alert("不存在的水质分析卡号！");
				parent.main.xhd.hykh.select() ;   
			//-->
			</SCRIPT>
<%
			return;
		}
		rs.close();
		ps.close();

		if(sfzf.equals("Y")){//是否作废,0为作废，1为未作废
%>
			<SCRIPT language=javascript >
			<!--
				alert("水质分析卡号已经作废！");
				parent.main.xhd.hykh.select() ;   
			//-->
			</SCRIPT>
<%
			return;
		}
		%>
		<SCRIPT language=javascript >
		<!--
			parent.main.xhd.hybh.value="<%=hybh%>";   
			parent.main.xhd.hyxm.value="<%=hyxm%>";   
			parent.main.xhd.hyjb.value="<%=hyjb%>";
			parent.main.xhd.cpbm.select() ;   
		//-->
		</SCRIPT>
		<%
	}
}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close();   
		if (ps1!= null) ps1.close();   
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>