<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrdw=(String)session.getAttribute("dwbh");

String ssfgs = request.getParameter("ssfgs");

String[] khbh =request.getParameterValues("khbh");
String[] hth =request.getParameterValues("hth");
String[] fklxbm =request.getParameterValues("fklxbm");
String[] fkcs =request.getParameterValues("fkcs");
String[] gysbh =request.getParameterValues("gysbh");
String[] ddbh =request.getParameterValues("ddbh");
String[] fkjeStr =request.getParameterValues("fkje");
String[] sksjStr =request.getParameterValues("sksj");
String[] skr =request.getParameterValues("skr");
String[] skdw =request.getParameterValues("skdw");

String[] bz =request.getParameterValues("bz");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		java.sql.Date sksj=null;
		sksj=java.sql.Date.valueOf(sksjStr[i]);
		double fkje=0;
		fkje=Double.parseDouble(fkjeStr[i]);


		String sjs="";
		String sjsbh="";
		String dwbh="";
		String fkkhxm="";
		String fkfwdz="";

		if (hth[i].equals(""))
		{
			sql="select sjs,sjsbh,zxdm,khxm,fwdz ";
			sql+=" from  crm_zxkhxx";
			sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery(sql);
			if (rs.next())
			{
				sjs=cf.fillNull(rs.getString("sjs"));
				sjsbh=cf.fillNull(rs.getString("sjsbh"));
				dwbh=cf.fillNull(rs.getString("zxdm"));
				fkkhxm=cf.fillNull(rs.getString("khxm"));
				fkfwdz=cf.fillNull(rs.getString("fwdz"));
			}
			rs.close();
			ps.close();
		}
		else{
			sql="select sjs,sjsbh,dwbh,khxm,fwdz ";
			sql+=" from  crm_khxx";
			sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery(sql);
			if (rs.next())
			{
				sjs=cf.fillNull(rs.getString("sjs"));
				sjsbh=cf.fillNull(rs.getString("sjsbh"));
				dwbh=cf.fillNull(rs.getString("dwbh"));
				fkkhxm=cf.fillNull(rs.getString("khxm"));
				fkfwdz=cf.fillNull(rs.getString("fwdz"));
			}
			rs.close();
			ps.close();
		}
		

		
		java.sql.Date lrsj=cf.getDate();

		if (fklxbm[i].equals("aaaaa"))//订金转家装款
		{
			String fkxh="";
			int count=0;
			sql="select NVL(max(substr(fkxh,8,3)),0)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"'  ";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery(sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int fkjsq=count;
			while (true)
			{
				fkjsq++;
				fkxh=khbh[i]+cf.addZero(fkjsq,3);

				sql="select count(*) ";
				sql+=" from  cw_khfkjl";
				sql+=" where fkxh='"+fkxh+"'  ";
				ps= conn.prepareStatement(sql);
				rs =ps.executeQuery(sql);
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					break;
				}
			}

			//插入：量房订金
			sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,fkcs,yfkbl,yfkje   ,sfkbl,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh,zczjxbh,czlx,zrkdcpz,zckdcpz,sjr,sjsj   ,gljlbz,skdd,dsksjbz,jzwkqs,fkkhxm,fkfwdz,zzyhkh,gysbh,ddbh ) ";
			sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,'N',?,?,?                            ,?,?,?,?,?,?,?,?,'1','0','0',?,?                                                   ,'N',?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,khbh[i]);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,"52");//52：量房订金
			ps.setDouble(5,fkje);
			ps.setString(6,"");
			ps.setString(7,cf.GB2Uni(skr[i]));
			ps.setDate(8,sksj);
			ps.setString(9,skdw[i]);
			ps.setString(10,yhmc);

			ps.setDate(11,lrsj);
			ps.setString(12,cf.GB2Uni(bz[i]));
			ps.setString(13,"11");//11:现金
			ps.setString(14,"");
			ps.setString(15,lrdw);
			ps.setString(16,"");
			ps.setDouble(17,0);
			ps.setDouble(18,0);

			ps.setDouble(19,0);
			ps.setString(20,sjs);
			ps.setString(21,sjsbh);
			ps.setString(22,dwbh);
			ps.setString(23,ssfgs);
			ps.setString(24,"");
			ps.setString(25,"");
			ps.setString(26,"");
			ps.setString(27,cf.GB2Uni(skr[i]));
			ps.setDate(28,sksj);

			ps.setString(29,"1");//1：不需审核；2：需审核
			ps.setString(30,"");
			ps.setString(31,"N");//家装尾款全收  Y：全收；N：否

			ps.setString(32,fkkhxm);
			ps.setString(33,fkfwdz);
			ps.setString(34,"");
			ps.setString(35,cf.GB2Uni(gysbh[i]));
			ps.setString(36,ddbh[i]);
			ps.executeUpdate();
			ps.close();

			double sfke=0;
			double maxsfke=0;
			java.sql.Date jlfdjsj=null;
			String lfdjbz="N";
			sql="select sum(fkje),max(fkje),min(sksj)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"' and fklxbm='52' and scbz='N'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//量房订金
				maxsfke=rs.getDouble(2);//最大量房订金
				jlfdjsj=rs.getDate(3);//交量房订金时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					lfdjbz="T";
				}
				else{
					lfdjbz="N";
				}
			}

			sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
			sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(sql);
			ps.setString(1,lfdjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jlfdjsj);
			ps.executeUpdate();
			ps.close();

			//插入：家装款
			fkxh="";
			count=0;
			sql="select NVL(max(substr(fkxh,8,3)),0)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"'  ";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery(sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			fkjsq=count;
			while (true)
			{
				fkjsq++;
				fkxh=khbh[i]+cf.addZero(fkjsq,3);

				sql="select count(*) ";
				sql+=" from  cw_khfkjl";
				sql+=" where fkxh='"+fkxh+"'  ";
				ps= conn.prepareStatement(sql);
				rs =ps.executeQuery(sql);
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					break;
				}
			}

			sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,fkcs,yfkbl,yfkje   ,sfkbl,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh,zczjxbh,czlx,zrkdcpz,zckdcpz,sjr,sjsj   ,gljlbz,skdd,dsksjbz,jzwkqs,fkkhxm,fkfwdz,zzyhkh,gysbh,ddbh ) ";
			sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,'N',?,?,?                            ,?,?,?,?,?,?,?,?,'1','0','0',?,?                                                   ,'N',?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,khbh[i]);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,"11");//11：家装款
			ps.setDouble(5,fkje);
			ps.setString(6,"");
			ps.setString(7,cf.GB2Uni(skr[i]));
			ps.setDate(8,sksj);
			ps.setString(9,skdw[i]);
			ps.setString(10,yhmc);

			ps.setDate(11,lrsj);
			ps.setString(12,cf.GB2Uni(bz[i]));
			ps.setString(13,"31");//31：转换款项
			ps.setString(14,"52");//52：量房订金
			ps.setString(15,lrdw);
			ps.setString(16,fkcs[i]);
			ps.setDouble(17,0);
			ps.setDouble(18,0);

			ps.setDouble(19,0);
			ps.setString(20,sjs);
			ps.setString(21,sjsbh);
			ps.setString(22,dwbh);
			ps.setString(23,ssfgs);
			ps.setString(24,"");
			ps.setString(25,"");
			ps.setString(26,"");
			ps.setString(27,cf.GB2Uni(skr[i]));
			ps.setDate(28,sksj);

			ps.setString(29,"1");//1：不需审核；2：需审核
			ps.setString(30,"");
			ps.setString(31,"N");//家装尾款全收  Y：全收；N：否

			ps.setString(32,fkkhxm);
			ps.setString(33,fkfwdz);
			ps.setString(34,"");
			ps.setString(35,cf.GB2Uni(gysbh[i]));
			ps.setString(36,ddbh[i]);
			ps.executeUpdate();
			ps.close();


			//转换付款方式，生成关联记录
			int glxh=0;//关联序号
			count=0;


			//获取关联序号
			sql="select NVL(max(glxh),0)";
			sql+=" from  cw_glfkjl";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				glxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			glxh++;

			//插入关联记录 
			sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setInt(1,glxh);
			ps.setString(2,fkxh);
			ps.executeUpdate();
			ps.close();

			sql="update cw_khfkjl set glxh=?";
			sql+=" where fkxh='"+fkxh+"'";
			ps= conn.prepareStatement(sql);
			ps.setInt(1,glxh);
			ps.executeUpdate();
			ps.close();

			
			//插入关联付款记录 
			String newfkxh=null;
			sql="select NVL(max(substr(fkxh,8,3)),0)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"'  ";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newfkxh=khbh[i]+cf.addZero(count+1,3);

			//fkxh=newfkxh
			//增加glxh
			//增加gljlbz
			//增加gysbh=zcgysbh
			//fklxbm=zckx
			//fkje=-1*fkje
			//zckx=fklxbm
			//zcgysbh=""
			//fkcs=""
			//yfkbl=""
			//yfkje=""
			//sfkbl=""

			sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,fkcs,yfkbl,yfkje   ,sfkbl,sjs,sjsbh,dwbh,fgsbh,czlx,zrkdcpz,zckdcpz   ,sjr,sjsj,glxh,gysbh,ddbh,zjxbh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh) ";
			sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,'N',?,?,?                            ,?,?,?,?,?,'1','0','0'                             ,?,?,?,?,?,?                      ,'Y',?,?,?,?,?) ";//1：财务收款；2：非财务代收款
			ps= conn.prepareStatement(sql);
			ps.setString(1,khbh[i]);
			ps.setString(2,newfkxh);
			ps.setString(3,"");
			ps.setString(4,"52");//52：量房订金
			ps.setDouble(5,-1*fkje);
			ps.setString(6,"");
			ps.setString(7,cf.GB2Uni(skr[i]));
			ps.setDate(8,sksj);
			ps.setString(9,skdw[i]);
			ps.setString(10,yhmc);

			ps.setDate(11,lrsj);
			ps.setString(12,cf.GB2Uni(bz[i]));
			ps.setString(13,"31");//31：转换款项
			ps.setString(14,"11");//11：家装款
			ps.setString(15,lrdw);
			ps.setString(16,"");
			ps.setString(17,"");
			ps.setString(18,"");

			ps.setString(19,"");
			ps.setString(20,sjs);
			ps.setString(21,sjsbh);
			ps.setString(22,dwbh);
			ps.setString(23,ssfgs);

			ps.setString(24,cf.GB2Uni(skr[i]));
			ps.setDate(25,sksj);
			ps.setInt(26,glxh);
			ps.setString(27,"");
			ps.setString(28,"");
			ps.setString(29,"");

			ps.setString(30,"1");//1：不需审核；2：需审核
			ps.setString(31,"");

			ps.setString(32,fkkhxm);
			ps.setString(33,fkfwdz);
			ps.setString(34,"");
			ps.executeUpdate();
			ps.close();

			//插入关联记录 
			sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setInt(1,glxh);
			ps.setString(2,newfkxh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			String fkxh="";
			int count=0;
			sql="select NVL(max(substr(fkxh,8,3)),0)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"'  ";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery(sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int fkjsq=count;
			while (true)
			{
				fkjsq++;
				fkxh=khbh[i]+cf.addZero(fkjsq,3);

				sql="select count(*) ";
				sql+=" from  cw_khfkjl";
				sql+=" where fkxh='"+fkxh+"'  ";
				ps= conn.prepareStatement(sql);
				rs =ps.executeQuery(sql);
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					break;
				}
			}

			sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,fkcs,yfkbl,yfkje   ,sfkbl,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh,zczjxbh,czlx,zrkdcpz,zckdcpz,sjr,sjsj   ,gljlbz,skdd,dsksjbz,jzwkqs,fkkhxm,fkfwdz,zzyhkh,gysbh,ddbh ) ";
			sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,'N',?,?,?                            ,?,?,?,?,?,?,?,?,'1','0','0',?,?                                                   ,'N',?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,khbh[i]);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,fklxbm[i]);
			ps.setDouble(5,fkje);
			ps.setString(6,"");
			ps.setString(7,cf.GB2Uni(skr[i]));
			ps.setDate(8,sksj);
			ps.setString(9,skdw[i]);
			ps.setString(10,yhmc);

			ps.setDate(11,lrsj);
			ps.setString(12,cf.GB2Uni(bz[i]));
			ps.setString(13,"11");//11:现金
			ps.setString(14,"");
			ps.setString(15,lrdw);
			ps.setString(16,fkcs[i]);
			ps.setDouble(17,0);
			ps.setDouble(18,0);

			ps.setDouble(19,0);
			ps.setString(20,sjs);
			ps.setString(21,sjsbh);
			ps.setString(22,dwbh);
			ps.setString(23,ssfgs);
			ps.setString(24,"");
			ps.setString(25,"");
			ps.setString(26,"");
			ps.setString(27,cf.GB2Uni(skr[i]));
			ps.setDate(28,sksj);

			ps.setString(29,"1");//1：不需审核；2：需审核
			ps.setString(30,"");
			ps.setString(31,"N");//家装尾款全收  Y：全收；N：否

			ps.setString(32,fkkhxm);
			ps.setString(33,fkfwdz);
			ps.setString(34,"");
			ps.setString(35,cf.GB2Uni(gysbh[i]));
			ps.setString(36,ddbh[i]);
			ps.executeUpdate();
			ps.close();
		}


	

	
	
	
	
		//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		double zjxssk=0;
		sql="select sum(fkje)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='11' and scbz='N' and fkcs in(8)";//8：增减项款

		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//增减项实收款
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//家装最近收款时间
		java.sql.Date getjzkscsj=null;//首次付家装款时间
		String getjzkfkxh=null;//家装最近收款序号
		int getjzkfkcs=0;//家装收款期数
		sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//已收工程款
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//取财务收款情况
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
		java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
		String getcwjzkfkxh=null;//财务家装最近收款序号
		int getcwjzkfkcs=0;//财务家装收款期数

		sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='11' and scbz='N' ";
		sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//已收工程款
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();



		if (getsfke<0)
		{
			conn.rollback();
			out.println("<P>错误！！！本项收款已为负数，请仔细检查");
			return;
		}

		String setjzwkqs=null;
		int wkcount=0;
		sql="select count(*)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='11' and scbz='N' and jzwkqs='Y'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wkcount=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (wkcount>0)
		{
			setjzwkqs="Y";
		}
		else{
			setjzwkqs="N";
		}

		sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?,jzwkqs=?";
		sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.setString(12,setjzwkqs);
		ps.executeUpdate();
		ps.close();

		//家装款更新--------------------------------------------完成



		//更新：量房订金
		double sfke=0;
		double maxsfke=0;
		java.sql.Date jlfdjsj=null;
		String lfdjbz="N";
		sql="select sum(fkje),max(fkje),min(sksj)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='52' and scbz='N'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//量房订金
			maxsfke=rs.getDouble(2);//最大量房订金
			jlfdjsj=rs.getDate(3);//交量房订金时间
		}
		rs.close();
		ps.close();


		if (sfke>0)
		{
			lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
		}
		else 
		{
			if (maxsfke>0)
			{
				lfdjbz="T";
			}
			else{
				lfdjbz="N";
			}
		}

		sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
		sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(sql);
		ps.setString(1,lfdjbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jlfdjsj);
		ps.executeUpdate();
		ps.close();

		//更新：促销活动订金

		sfke=0;
		maxsfke=0;
		java.sql.Date jhddjsj=null;
		String hddjbz="N";
		sql="select sum(fkje),max(fkje),min(sksj)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='51' and scbz='N'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//活动订金
			maxsfke=rs.getDouble(2);//最大活动订金
			jhddjsj=rs.getDate(3);//交活动订金时间
		}
		rs.close();
		ps.close();

		if (sfke>0)
		{
			hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
		}
		else 
		{
			if (maxsfke>0)
			{
				hddjbz="T";
			}
			else{
				hddjbz="N";
			}
		}

		sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//设计费是否可转出
		sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(sql);
		ps.setString(1,hddjbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jhddjsj);
		ps.executeUpdate();
		ps.close();


		//更新：设计费
		sfke=0;
		maxsfke=0;
		java.sql.Date jsjfsj=null;
		String sjfbz="N";
		sql="select sum(fkje),max(fkje),min(sksj)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='53' and scbz='N'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//设计费
			maxsfke=rs.getDouble(2);//最大设计费
			jsjfsj=rs.getDate(3);//交设计费时间
		}
		rs.close();
		ps.close();


		if (sfke>0)
		{
			sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
		}
		else 
		{
			if (maxsfke>0)
			{
				sjfbz="T";
			}
			else{
				sjfbz="N";
			}
		}

		sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
		sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(sql);
		ps.setString(1,sjfbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jsjfsj);
		ps.executeUpdate();
		ps.close();

		//设置：设计费记入业绩时间＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double sjhtje=0;
		java.sql.Date sjfjryjsj=null;
		sql="select sjhtje,sjfjryjsj";
		sql+=" from  crm_zxkhxx";
		sql+=" where khbh='"+khbh[i]+"' and qsjhtbz='Y'";//N：未签；Y：签合同
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjhtje=rs.getDouble(1);//设计合同金额
			sjfjryjsj=rs.getDate(2);//设计费记入业绩时间
		}
		rs.close();
		ps.close();


		double cwsssjf=0;
		sql="select sum(fkje)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and fklxbm='53' and scbz='N'";
		sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cwsssjf=rs.getDouble(1);//设计费
		}
		rs.close();
		ps.close();

		if (sjfjryjsj==null)
		{
			if (cwsssjf>=sjhtje)
			{
				sjfjryjsj=sksj;
				sql="update crm_zxkhxx set sjfjryjsj=?";
				sql+=" where khbh='"+khbh[i]+"'";
				ps= conn.prepareStatement(sql);
				ps.setDate(1,sjfjryjsj);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			if (cwsssjf<sjhtje)
			{
				sjfjryjsj=null;
				sql="update crm_zxkhxx set sjfjryjsj=?";
				sql+=" where khbh='"+khbh[i]+"'";
				ps= conn.prepareStatement(sql);
				ps.setDate(1,sjfjryjsj);
				ps.executeUpdate();
				ps.close();
			}
		}
		//设置：设计费记入业绩时间＝＝＝＝＝＝＝＝＝＝＝＝＝结束


		//更新:主材款
		if (!ddbh.equals(""))
		{
			double sskje=0;//实收款金额
			sql="select sum(fkje)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"' and scbz='N' ";
			sql+=" and ddbh='"+ddbh+"'";
			sql+=" and zjxbh is null";
			sql+=" and fklxbm='23'";//23:主材
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (sskje<0)
			{
				conn.rollback();
				out.println("错误！该订单累计付款总额不能为负数:"+sskje);
				return;
			}

			double shsskje=0;//财务审核实收款金额
			sql="select sum(fkje)";
			sql+=" from  cw_khfkjl";
			sql+=" where khbh='"+khbh[i]+"' and scbz='N' ";
			sql+=" and ddbh='"+ddbh+"'";
			sql+=" and zjxbh is null";
			sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			sql+=" and fklxbm='23'";//23:主材
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			sql="update jc_zcdd set sskje=?,shsskje=? ";
			sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double gethkze=0;
			java.sql.Date yjjzsj=null;
			sql="select hkze,yjjzsj";
			sql+=" from  jc_zcdd";
			sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gethkze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();


			if (yjjzsj==null)
			{
				if (shsskje>=gethkze)
				{
					yjjzsj=sksj;

					sql="update jc_zcdd set yjjzsj=?";
					sql+=" where ddbh='"+ddbh+"'";
					ps= conn.prepareStatement(sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();

				}
			}
			else{
				if (shsskje<gethkze)
				{
					yjjzsj=null;

					sql="update jc_zcdd set yjjzsj=?";
					sql+=" where ddbh='"+ddbh+"'";
					ps= conn.prepareStatement(sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
		}


		double getkhfkze=0;
		java.sql.Date minkhsksj=null;
		java.sql.Date maxkhsksj=null;
		sql="select sum(fkje),min(sksj),max(sksj)";
		sql+=" from  cw_khfkjl";
		sql+=" where khbh='"+khbh[i]+"' and scbz='N'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkhfkze=rs.getDouble(1);
			minkhsksj=rs.getDate(2);
			maxkhsksj=rs.getDate(3);
		}
		rs.close();
		ps.close();

		sql="update crm_zxkhxx set scfksj=?,zjfksj=?,fkze=?";
		sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(sql);
		ps.setDate(1,minkhsksj);
		ps.setDate(2,maxkhsksj);
		ps.setDouble(3,getkhfkze);
		ps.executeUpdate();
		ps.close();
		
	
	
	}



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
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
