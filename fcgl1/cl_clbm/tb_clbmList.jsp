<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,webservice.bean.*,java.util.*,org.apache.axis.client.Call,org.apache.axis.client.Service,java.text.SimpleDateFormat,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;

try {
	conn=cf.getConnection();
	String ls_sql=null;
	String wheresql="";
	String clbm=null;

	String lrjsfs=null;
	String lrbfb=null;
	String cldlmc=null;
	String url = cf.getValue("kb_url");
//	url="http://192.168.152.44:8280/Kebao/services/BoloniForYblService?wsdl";

	//同步接口
	String decType="松下亿达环保型";

	Service service = new Service();
	Call call;
	call = (Call) service.createCall();

	call.setTargetEndpointAddress(new java.net.URL(url) );

	QName qn = new QName("urn:BeanService", "MtrInfo");
	call.registerTypeMapping(MtrInfo.class, qn, new BeanSerializerFactory(MtrInfo.class, qn), 
				new BeanDeserializerFactory(MtrInfo.class, qn));

	call.setOperationName(new QName("MtrInfo","listMtrInfoByDecType"));
	//call.setOperationName(new QName("Order", "listOrderByOrderId"));
	//设定传入的参数，
	call.addParameter("decType",qn, ParameterMode.IN);
	//设定返回的参数
	call.setReturnType(qn,MtrInfo[].class);



	MtrInfo[] mtrs=null;
	mtrs=(MtrInfo[])call.invoke(new Object[]{decType});

/*
String mtrId;//物料编号
String mtrName  ;  //物料名称
String mtrSpec;// 物料规格
String mtrUnit;// 物料单位
Double mtrCose;// 对工结算价
String decType;// 装修类型
String mtrStatus;//物料状态
*/

	conn.setAutoCommit(false);

	String result="";
	int j=0;		
	for(int i=0;i<mtrs.length;i++)
	{

		String getClbm=null;
		String getClmc=null;
		String getClgg=null;
		String getJldwmc=null;
		double getGdj=0;
		String getLx=null;
		String getBjjb=null;

		getClbm=mtrs[i].getMtrId();
		getClmc=cf.fillNull(mtrs[i].getMtrName());
		getClgg=cf.fillNull(mtrs[i].getMtrSpec());
		getJldwmc=cf.fillNull(mtrs[i].getMtrUnit());
		getGdj=mtrs[i].getMtrCose();
		getLx=cf.fillNull(mtrs[i].getMtrStatus());
		getBjjb=cf.fillNull(mtrs[i].getDecType());


		if (getClmc.equals("&nbsp;") || getClmc.equals("null"))
		{
			getClmc="";
		}
		if (getClgg.equals("&nbsp;") || getClgg.equals("null"))
		{
			getClgg="";
		}
		if (getJldwmc.equals("&nbsp;") || getJldwmc.equals("null"))
		{
			getJldwmc="";
		}

		if (getLx.equals("closed"))
		{
			getLx="3";//停用
			continue;
		}
		else{
			getLx="2";//非常用
		}

		ls_sql="select bjjbbm";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbmc='"+getBjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getBjjb=rs.getString("bjjbbm");
		}
		else{
			conn.rollback();
			out.println("同步失败！不存在的报价级别:"+getBjjb);
			return;
		}
		rs.close();
		ps.close();


		int count=0;
		ls_sql="SELECT clbm  ";
		ls_sql+=" FROM cl_clbm";
		ls_sql+=" where clbm='"+getClbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if(rs.next())
		{
			clbm=rs.getString(1);

			count++;
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			ls_sql="update cl_clbm set clmc='"+getClmc+"',clgg='"+getClgg+"',jldwmc='"+getJldwmc+"'  ";
			ls_sql+=" where clbm='"+getClbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate(ls_sql);
			ps.close();
		}
/*	
		else{
			ls_sql="insert into cl_clbm ( clbm,clmc,clgg,jldwmc,lrjsfs,lrbfb,cldlmc,bz,lrr,lrsj,wxr,lx,paixu ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,SYSDATE,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,getClbm);
			ps.setString(2,getClmc);
			ps.setString(3,getClgg);
			ps.setString(4,getJldwmc);
			ps.setString(5,"2");
			ps.setDouble(6,0);
			ps.setString(7,cldlmc);
			ps.setString(8,bz);
			ps.setString(9,yhmc);
			ps.setString(11,"");
			ps.setString(12,"2");
			ps.setString(13,0);
			ps.executeUpdate();
			ps.close();

			//初始化材料价格明细（cl_jgmx）
			String jgdwbh=null;
			ls_sql="select dwbh ";
			ls_sql+=" from sq_dwxx ";
			ls_sql+=" where dwlx='F0' and cxbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				jgdwbh=rs.getString(1);

				sql=" insert into cl_jgmx ( clbm,dwbh,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj,sfycx ) ";
				sql+=" values ( ?,?,0,0,0,0,'请录入仓库','Y',?,TRUNC(SYSDATE),'N' ) ";
				ps1= conn.prepareStatement(sql);
				ps1.setString(1,getClbm);
				ps1.setString(2,jgdwbh);
				ps1.setString(3,yhmc);
				ps1.executeUpdate();
				ps1.close();
			}
			rs.close();
			ps.close();

		}
*/

		j++;


	}

	conn.commit();

	out.println("同步成功！同步的数据共"+j+"行");

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
} 
%>

<html>
<head>
</head>


</html>