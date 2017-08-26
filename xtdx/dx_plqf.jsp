<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- 短信发送包 -->
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] khbh=request.getParameterValues("khbh");
String[] lxfs=request.getParameterValues("lxfs");
String xxnr=cf.GB2Uni(request.getParameter("xxnr"));//接收传递过来的短信内容
String xxqz=cf.GB2Uni(request.getParameter("xxqz"));//接收传递过来的短信前缀
String lx=cf.GB2Uni(request.getParameter("lx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql="";
String dxcs="";
String dxnr="";

int count=0;


try {
	conn=cf.getConnection();


	out.println("<P>开始发送短信：<P>");


	if (lx.equals("0"))//非模版)发送
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			if (lxfs[i].trim().equals(""))
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』电话为空，不发送短信</font>");
				continue;
			}

			ls_sql="select khbh,khxm||decode(xb,'M','先生','W','女士') dxnr ";
			ls_sql+=" from crm_khxx ";
			ls_sql+=" where  khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count++;
				if (xxqz.equals("Y"))//自动匹配客户姓名性别
				{
					dxnr="尊敬的"+rs.getString("dxnr")+","+xxnr;//短信内容
				}
				else 
				{
					dxnr=xxnr;
				}

//				out.println("<BR>"+count+":"+lxfs[i]+":"+dxnr);//将发送结果显示到页面上

				dxcs=FSDX.jsdxfs(lxfs[i],dxnr,yhmc);

				out.println("<BR>"+count+":"+dxcs);//将发送结果显示到页面上
			}
			rs.close();
			ps.close();
		}
	}
	else if (lx.equals("1"))//发送(开工提示)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			if (lxfs[i].trim().equals(""))
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』电话为空，不发送短信</font>");
				continue;
			}

			String gcjdbm="";
			String fgsbh=null;
			String dwbh=null;
			String sgd=null;
			String sjs=null;
			String zjxm=null;
			String kfdh=null;
			String sgdmc="";
			String sgddh="";
			String sjsdh="";
			String zjdh="";
			ls_sql="select crm_khxx.gcjdbm,crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.khxm||decode(crm_khxx.xb,'M','先生','W','女士') dxnr,crm_khxx.sgd,crm_khxx.sjs,crm_khxx.zjxm,sq_dwxx.kfdh ";
			ls_sql+=" from crm_khxx,sq_dwxx ";
			ls_sql+=" where  crm_khxx.fgsbh=sq_dwxx.dwbh and khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{

				gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
				fgsbh=cf.fillNull(rs.getString("fgsbh"));
				dwbh=cf.fillNull(rs.getString("dwbh"));
				dxnr=cf.fillNull(rs.getString("dxnr"));
				sgd=cf.fillNull(rs.getString("sgd"));
				sjs=cf.fillNull(rs.getString("sjs"));
				zjxm=cf.fillNull(rs.getString("zjxm"));
				kfdh=cf.fillNull(rs.getString("kfdh"));

				if (xxqz.equals("Y"))//自动匹配客户姓名性别
				{
					dxnr="尊敬的"+dxnr+",";
				}
				else{
					dxnr="";
				}
			}
			rs.close();
			ps.close();

			if (!gcjdbm.equals("2"))//1：未开工；2： 工程开工；4: 工程完工；5:：客户完结
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』未开工或已完工，不发送短信</font>");
				continue;
			}


			//施工队电话
			ls_sql=" select sgdmc,dh from sq_sgd";
			ls_sql+=" where sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				sgddh=cf.fillNull(rs.getString("dh"));
			}
			rs.close();
			ps.close();

			//设计师电话
			ls_sql=" select dh from sq_yhxx";
			ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjsdh=cf.fillNull(rs.getString("dh"));
			}
			rs.close();
			ps.close();
		
			//质检电话
			ls_sql=" select dh ";
			ls_sql+=" from sq_yhxx";
			ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjdh=cf.fillNull(rs.getString("dh"));
			}
			rs.close();
			ps.close();
		

			//生成短信内容＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			dxnr=dxnr+"感谢您选择松下亿达！";
			if (!kfdh.equals(""))
			{
				dxnr=dxnr+"如有问题或建议请致电：客服"+kfdh+"、集团客服4008182588。";
			}
			else{
				dxnr=dxnr+"如有问题或建议请致电：集团客服4008182588。";
			}

			dxnr=dxnr+"为您服务的人员：";

			if (!sgdmc.equals(""))
			{
				dxnr=dxnr+"施工"+sgdmc+sgddh+"、";
			}
			if (!sjs.equals(""))
			{
				dxnr=dxnr+"设计"+sjs+sjsdh+"、";
			}
			if (!zjxm.equals(""))
			{
				dxnr=dxnr+"质量监理"+zjxm+zjdh;
			}

			dxnr=dxnr+"（请予保留";

			//生成短信内容======================完成

			count++;
//			out.println("<BR>"+count+":"+lxfs[i]+":"+dxnr);//将发送结果显示到页面上

			dxcs=FSDX.jsdxfs(lxfs[i],dxnr,yhmc);

			out.println("<BR>"+count+":"+dxcs);//将发送结果显示到页面上
		
		}
	}
	else if (lx.equals("2"))//发送(完工提示)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			if (lxfs[i].trim().equals(""))
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』电话为空，不发送短信</font>");
				continue;
			}

			String kfdh=null;
			String sjjgrq="";
			String gcjdbm="";
			ls_sql="select crm_khxx.gcjdbm,crm_khxx.khxm||decode(crm_khxx.xb,'M','先生','W','女士') dxnr,TO_CHAR(crm_khxx.sjjgrq,'YYYY')||'年'||TO_CHAR(crm_khxx.sjjgrq,'MM')||'月'||TO_CHAR(crm_khxx.sjjgrq,'DD')||'日' sjjgrq,sq_dwxx.kfdh ";
			ls_sql+=" from crm_khxx,sq_dwxx ";
			ls_sql+=" where  crm_khxx.fgsbh=sq_dwxx.dwbh and khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{

				gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
				dxnr=cf.fillNull(rs.getString("dxnr"));
				kfdh=cf.fillNull(rs.getString("kfdh"));
				sjjgrq=cf.fillNull(rs.getString("sjjgrq"));

				if (xxqz.equals("Y"))//自动匹配客户姓名性别
				{
					dxnr="尊敬的"+dxnr+",";
				}
				else{
					dxnr="";
				}
			}
			rs.close();
			ps.close();


			if (!gcjdbm.equals("4") && !gcjdbm.equals("5"))//1：未开工；2： 工程开工；4: 工程完工；5:：客户完结
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』未完工，不发送短信</font>");
				continue;
			}

			if (sjjgrq.equals("年月日"))
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』无完工时间，不发送短信</font>");
				continue;
			}

		

			//生成短信内容＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			dxnr=dxnr+"感谢您选择松下亿达！";

			dxnr=dxnr+"您家工地在"+sjjgrq+"完工进入2年保修期。";

			if (!kfdh.equals(""))
			{
				dxnr=dxnr+"如您在此过程中有维修项目，请与我们联系，客服部"+kfdh+"、松下亿达工程客服中心400-818-2588";
			}
			else{
				dxnr=dxnr+"如您在此过程中有维修项目，请与我们联系，松下亿达工程客服中心400-818-2588";
			}

			//生成短信内容======================完成

			count++;
//			out.println("<BR>"+count+":"+lxfs[i]+":"+dxnr);//将发送结果显示到页面上

			dxcs=FSDX.jsdxfs(lxfs[i],dxnr,yhmc);

			out.println("<BR>"+count+":"+dxcs);//将发送结果显示到页面上
		
		}
	}
	else if (lx.equals("3"))//发送(到保前)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			if (lxfs[i].trim().equals(""))
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』电话为空，不发送短信</font>");
				continue;
			}

			String kfdh=null;
			String bxjzsj="";
			String gcjdbm="";
			ls_sql="select crm_khxx.gcjdbm,crm_khxx.khxm||decode(crm_khxx.xb,'M','先生','W','女士') dxnr,TO_CHAR(crm_khxx.bxjzsj,'YYYY')||'年'||TO_CHAR(crm_khxx.bxjzsj,'MM')||'月'||TO_CHAR(crm_khxx.bxjzsj,'DD')||'日' bxjzsj,sq_dwxx.kfdh ";
			ls_sql+=" from crm_khxx,sq_dwxx ";
			ls_sql+=" where  crm_khxx.fgsbh=sq_dwxx.dwbh and khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{

				gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
				dxnr=cf.fillNull(rs.getString("dxnr"));
				kfdh=cf.fillNull(rs.getString("kfdh"));
				bxjzsj=cf.fillNull(rs.getString("bxjzsj"));

				if (xxqz.equals("Y"))//自动匹配客户姓名性别
				{
					dxnr="尊敬的"+dxnr+",";
				}
				else{
					dxnr="";
				}
			}
			rs.close();
			ps.close();

			if (!gcjdbm.equals("4") && !gcjdbm.equals("5"))//1：未开工；2： 工程开工；4: 工程完工；5:：客户完结
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』未完工，不发送短信</font>");
				continue;
			}

			if (bxjzsj.equals("年月日"))
			{
				out.println("<BR><font color='blue'>第个『"+(i+1)+"』无保修截至时间，不发送短信</font>");
				continue;
			}

		

			//生成短信内容＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			dxnr=dxnr+"感谢您选择松下亿达！";

			if (!bxjzsj.equals("年月日"))
			{
				dxnr=dxnr+"您家工地在"+bxjzsj+"保修期结束。";
			}
			else{
				dxnr=dxnr+"您家工地保修期已结束。";
			}

			if (!kfdh.equals(""))
			{
				dxnr=dxnr+"尽心服务是我们的宗旨，如您仍有维修项目，请与我们联系，客服部"+kfdh+"、松下亿达工程客服中心400-818-2588";
			}
			else{
				dxnr=dxnr+"尽心服务是我们的宗旨，如您仍有维修项目，请与我们联系，松下亿达工程客服中心400-818-2588";
			}

			//生成短信内容======================完成

			count++;
//			out.println("<BR>"+count+":"+lxfs[i]+":"+dxnr);//将发送结果显示到页面上

			dxcs=FSDX.jsdxfs(lxfs[i],dxnr,yhmc);

			out.println("<BR>"+count+":"+dxcs);//将发送结果显示到页面上
		
		}
	}


	out.println("<P>发送结束");
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>