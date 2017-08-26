<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=request.getParameter("kpjlh");
String qssj=request.getParameter("qssj");
String jzsj=request.getParameter("jzsj");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String sgd=null;

//计算质量得分
int zjypf=0;//质检员评分
int xjypf=0;//巡检员评分
int gsccpf=0;//公司抽查评分
int count=0;
int khpjpf=0;//客户评价评分
int wghfpf=0;//完工回访评分
int phpf=0;//配合评分

int zjypf1=0;
int zjypf2=0;
int xjypf1=0;
int xjypf2=0;
int gsccpf1=0;
int gsccpf2=0;
int khpjpf1=0;
int khpjpf2=0;
int wghfpf1=0;
int wghfpf2=0;
int phpf1=0;
int phpf2=0;

int zjydf=0;//质检员得分
int xjydf=0;//巡检员得分
int gsccdf=0;//公司抽查得分
int khpjdf=0;//客户评价得分
int wghfdf=0;//完工回访得分
int phdf=0;//配合得分

int kpgds=0;//考评工地数

try {
	conn=cf.getConnection();
	
	conn.setAutoCommit(false);

	//删除工地评分表
	ls_sql=" delete from kp_sgdpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//删除施工队接单情况表
	ls_sql=" delete from kp_sgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//计算工地评分表
	ls_sql=" insert into kp_sgdpfb(kpjlh,khbh,sjs,sgd,zjxm,sjjgrq)";
	ls_sql+=" select "+kpjlh+",khbh,sjs,sgd,zjxm,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.sjjgrq>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+jzsj+"','YYYY-MM-DD')";
	ls_sql+=" and kpbz='N' and zt='2' and wgbz='Y'";//已完工,未考评
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int kfcs=0;
	int bkzf=0;
	int zlfwlcs=0;
	int qcbzcs=0;
	int zdqccs=0;
	int btdcs=0;
	int tdys=0;
	
	ls_sql=" select khbh";
	ls_sql+=" from  kp_sgdpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		khbh=rs1.getString("khbh");

		//计算质量得分+++++++++++++++++

		//扣分次数、被扣总分
		kfcs=0;
		bkzf=0;
		ls_sql=" select count(*),sum(kp_kpcfbm.cfdf)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh";//
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_kpcfbm.cflx='1'";//1：扣分；2：质量分为0 ；3：清除班组；4：整队清除；5：整队停单
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			kfcs=rs.getInt(1);
			bkzf=rs.getInt(2);
		}
		rs.close();
		ps.close();

		//质量分为0次数
		zlfwlcs=0;
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh";//
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_kpcfbm.cflx='2'";//1：扣分；2：质量分为0 ；3：清除班组；4：整队清除；5：整队停单
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zlfwlcs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//清除班组
		qcbzcs=0;
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh";//
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_kpcfbm.cflx='3'";//1：扣分；2：质量分为0 ；3：清除班组；4：整队清除；5：整队停单
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qcbzcs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//整队清除
		zdqccs=0;
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh";//
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_kpcfbm.cflx='4'";//1：扣分；2：质量分为0 ；3：清除班组；4：整队清除；5：整队停单
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zdqccs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//整队停单
		btdcs=0;
		tdys=0;
		ls_sql=" select count(*),sum(kp_kpcfbm.cfdf)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh";//
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_kpcfbm.cflx='5'";//1：扣分；2：质量分为0 ；3：清除班组；4：整队清除；5：整队停单
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			btdcs=rs.getInt(1);
			tdys=rs.getInt(2);
		}
		rs.close();
		ps.close();

		//计算质检员评分
		ls_sql=" select sum(kp_kpcfbm.cfdf)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh and kplx='1'";//1：质检员；2：巡检员；3：公司抽查
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm";
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjypf=rs.getInt(1);
		}
		else{
			zjypf=0;
		}
		rs.close();
		ps.close();
		//计算巡检员评分
		ls_sql=" select sum(kp_kpcfbm.cfdf)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh and kplx='2'";//1：质检员；2：巡检员；3：公司抽查
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm";
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjypf=rs.getInt(1);
		}
		else{
			xjypf=0;
		}
		rs.close();
		ps.close();
		//计算公司抽查评分
		ls_sql=" select sum(kp_kpcfbm.cfdf)";
		ls_sql+=" from  kp_gczljcb,kp_jcmxb,kp_kpcfbm";
		ls_sql+=" where kp_gczljcb.kpxh=kp_jcmxb.kpxh and kplx='3'";//1：质检员；2：巡检员；3：公司抽查
		ls_sql+=" and kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm";
		ls_sql+=" and kp_gczljcb.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gsccpf=rs.getInt(1);
		}
		else{
			gsccpf=0;
		}
		rs.close();
		ps.close();


		//计算客户评价+++++++++++++++++
		//客户评价表评分
		ls_sql=" select sum(DECODE(sgzl,'Y',10,'N',0)+DECODE(sgxc,'Y',5,'N',0)+DECODE(wmsgcd,'Y',5,'N',0)+DECODE(gcjd,'Y',10,'N',0)+DECODE(ctfw,'Y',10,'N',0)+DECODE(pscl,'Y',5,'N',0)+DECODE(dmcl,'Y',5,'N',0))";
		ls_sql+=" from  kp_khpjb";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khpjpf=rs.getInt(1);
		}
		else{
			khpjpf=0;
		}
		rs.close();
		ps.close();

		//完工回访评分,满意为8分，较满意为5分，不满意为0分
		ls_sql=" select sum(DECODE(fwsz,'21',8,'22',5,'23',0)+DECODE(sgzl,'21',8,'22',5,'23',0)+DECODE(grsz,'Y','21',8,'22',5,'23',0))";
		ls_sql+=" from  crm_hfjl";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='24'";//完工回访
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wghfpf=rs.getInt(1);
		}
		else{
			wghfpf=0;
		}
		rs.close();
		ps.close();

		//配合评分+++++++++++++++++
		ls_sql=" select phdf";
		ls_sql+=" from  kp_sgdphb";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			phpf=rs.getInt(1);
		}
		else{
			phpf=0;
		}
		rs.close();
		ps.close();
	
		//保存得分
		ls_sql=" update kp_sgdpfb set zjypf=?,xjypf=?,gsccpf=?,khpjpf=?,wghfpf=?,phpf=?,kfcs=?,bkzf=?,zlfwlcs=?,qcbzcs=?,zdqccs=?,btdcs=?,tdys=?";
		ls_sql+=" where khbh='"+khbh+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zjypf);
		ps.setInt(2,xjypf);
		ps.setInt(3,gsccpf);
		ps.setInt(4,khpjpf);
		ps.setInt(5,wghfpf);
		ps.setInt(6,phpf);

		ps.setInt(7,kfcs);
		ps.setInt(8,bkzf);
		ps.setInt(9,zlfwlcs);
		ps.setInt(10,qcbzcs);
		ps.setInt(11,zdqccs);
		ps.setInt(12,btdcs);
		ps.setInt(13,tdys);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	//计算实际得分++++++++++++
	//取最大最小值
	ls_sql=" select max(zjypf),min(zjypf),max(xjypf),min(xjypf)";
	ls_sql+=" ,max(gsccpf),min(gsccpf),max(khpjpf),min(khpjpf)";
	ls_sql+=" ,max(wghfpf),min(wghfpf),max(phpf),min(phpf)";
	ls_sql+=" from  kp_sgdpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		zjypf1=rs1.getInt(1);
		zjypf2=rs1.getInt(2);
		xjypf1=rs1.getInt(3);
		xjypf2=rs1.getInt(4);
		gsccpf1=rs1.getInt(5);
		gsccpf2=rs1.getInt(6);
		khpjpf1=rs1.getInt(7);
		khpjpf2=rs1.getInt(8);
		wghfpf1=rs1.getInt(9);
		wghfpf2=rs1.getInt(10);
		phpf1=rs1.getInt(11);
		phpf2=rs1.getInt(12);
	}
	rs1.close();
	ps1.close();

	//逐条计算得分：某工地单项得分=（该工地此项考评分-所有工地此项的最低考评分）÷（所有工地此项的最高考评分-所有工地此项的最低考评分）×该项满分
	ls_sql=" select khbh,zjypf,xjypf,gsccpf,khpjpf,wghfpf,phpf";
	ls_sql+=" from  kp_sgdpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		khbh=rs1.getString("khbh");
		zjypf=rs1.getInt("zjypf");
		xjypf=rs1.getInt("xjypf");
		gsccpf=rs1.getInt("gsccpf");
		khpjpf=rs1.getInt("khpjpf");
		wghfpf=rs1.getInt("wghfpf");
		phpf=rs1.getInt("phpf");

		//质检员得分
		if (zjypf1-zjypf2==0)
		{
			zjydf=0;
		}
		else{
			zjydf=(int)java.lang.Math.round((zjypf-zjypf2)*15.0/(zjypf1-zjypf2));
		}
		//巡检员得分
		if (xjypf1-xjypf2==0)
		{
			xjydf=0;
		}
		else{
			xjydf=(int)java.lang.Math.round((xjypf-xjypf2)*10.0/(xjypf1-xjypf2));
		}
		//公司抽查得分
		if (gsccpf1-gsccpf2==0)
		{
			gsccdf=0;
		}
		else{
			gsccdf=(int)java.lang.Math.round((gsccpf-gsccpf2)*5.0/(gsccpf1-gsccpf2));
		}

		//客户评价得分
		if (khpjpf1-khpjpf2==0)
		{
			khpjdf=0;
		}
		else{
			khpjdf=(int)java.lang.Math.round((khpjpf-khpjpf2)*7.0/(khpjpf1-khpjpf2));
		}
		//完工回访得分
		if (wghfpf1-wghfpf2==0)
		{
			wghfdf=0;
		}
		else{
			wghfdf=(int)java.lang.Math.round((wghfpf-wghfpf2)*8.0/(wghfpf1-wghfpf2));
		}
		//配合得分
		if (phpf1-phpf2==0)
		{
			phdf=0;
		}
		else{
			phdf=(int)java.lang.Math.round((phpf-phpf2)*8.0/(phpf1-phpf2));
		}

	
		//保存得分
		ls_sql=" update kp_sgdpfb set zjydf=?,xjydf=?,gsccdf=?,khpjdf=?,wghfdf=?,phdf=?";
		ls_sql+=" where khbh='"+khbh+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zjydf);
		ps.setInt(2,xjydf);
		ps.setInt(3,gsccdf);
		ps.setInt(4,khpjdf);
		ps.setInt(5,wghfdf);
		ps.setInt(6,phdf);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();

	//计算施工队接单情况表
	ls_sql=" insert into kp_sgdkpjg(kpjlh,sgd,zbj,bzs,kpgds)";
	ls_sql+=" select "+kpjlh+",dwbh,zbj,bzs,0";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwlx in('3','8')";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int	tspf=0;
	int qwwz=0;
	int yzwz=0;
	int tbyzwz=0;
	int qttscs=0;

	int	wxpf=0;
	int wxjslx=0;
	int wxwjslx=0;
	int fygdwx=0;
	int qtwxcs=0;

	int bypf=0;
	int mtby=0;
	int xjby=0;
	int byzj=0;

	int ybjpf=0;

	ls_sql=" select sgd";
	ls_sql+=" from  kp_sgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");

		//考评工地数
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_sgdpfb";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			kpgds=rs.getInt(1);
		}
		else{
			kpgds=0;
		}
		rs.close();
		ps.close();

		//施工队单项得分=所有工地得分之和÷工地总数
		ls_sql=" select ROUND(sum(zjydf)/count(*)),ROUND(sum(xjydf)/count(*)),ROUND(sum(gsccdf)/count(*)),ROUND(sum(khpjdf)/count(*)),ROUND(sum(wghfdf)/count(*)),ROUND(sum(phdf)/count(*)),sum(kfcs),sum(bkzf),sum(zlfwlcs),sum(qcbzcs),sum(zdqccs),sum(btdcs),sum(tdys)";
		ls_sql+=" from  kp_sgdpfb";
		ls_sql+=" where sgd='"+sgd+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjydf=rs.getInt(1);
			xjydf=rs.getInt(2);
			gsccdf=rs.getInt(3);
			khpjdf=rs.getInt(4);
			wghfdf=rs.getInt(5);
			phdf=rs.getInt(6);

			kfcs=rs.getInt(7);
			bkzf=rs.getInt(8);
			zlfwlcs=rs.getInt(9);
			qcbzcs=rs.getInt(10);
			zdqccs=rs.getInt(11);
			btdcs=rs.getInt(12);
			tdys=rs.getInt(13);
		
		}
		else{
			zjydf=0;
			xjydf=0;
			gsccdf=0;
			khpjdf=0;
			wghfdf=0;
			phdf=0;

			kfcs=0;
			bkzf=0;
			zlfwlcs=0;
			qcbzcs=0;
			zdqccs=0;
			btdcs=0;
			tdys=0;

		}
		rs.close();
		ps.close();

		if (zlfwlcs>0)//质量分为0次数
		{
			zjydf=0;
			xjydf=0;
			gsccdf=0;
		}

		//保存得分

		ls_sql=" update kp_sgdkpjg set zjydf=?,xjydf=?,gsccdf=?,khpjdf=?,wghfdf=?,phdf=?,kpgds=?,kfcs=?,bkzf=?,zlfwlcs=?,qcbzcs=?,zdqccs=?,btdcs=?,tdys=?";
		ls_sql+=" where sgd='"+sgd+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zjydf);
		ps.setInt(2,xjydf);
		ps.setInt(3,gsccdf);
		ps.setInt(4,khpjdf);
		ps.setInt(5,wghfdf);
		ps.setInt(6,phdf);
		ps.setInt(7,kpgds);

		ps.setInt(8,kfcs);
		ps.setInt(9,bkzf);
		ps.setInt(10,zlfwlcs);
		ps.setInt(11,qcbzcs);
		ps.setInt(12,zdqccs);
		ps.setInt(13,btdcs);
		ps.setInt(14,tdys);
		
		ps.executeUpdate();
		ps.close();

		//投诉评分
		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='1' and yzcdbm='01'";//01:轻微违章
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qwwz=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='1' and yzcdbm='02'";//02:严重违章
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yzwz=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='1' and yzcdbm='03'";//03:特别严重
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tbyzwz=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='1' and (yzcdbm not in('01','02','03') or yzcdbm is null)";//03:特别严重
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qttscs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//1次轻微违章-4；1次严重违章-7；1次特别严重-12
		tspf=qwwz*-4+yzwz*-7+tbyzwz*-12+qttscs*-4;


		//维修评分
		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='2' and wxsgd='"+sgd+"' and sfjslx='Y'";//Y:及时联系
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wxjslx=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='2' and wxsgd='"+sgd+"' and sfjslx='N'";//N:未及时联系
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wxwjslx=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='2' and wxsgd!='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fygdwx=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='2' and ( (wxsgd is null) or ( wxsgd is not null and sfjslx is null ) )";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qtwxcs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//1次及时联系-5、1次未及时联系-30、非原工队维修扣15分
		wxpf=wxjslx*-5+wxwjslx*-30+fygdwx*-15+qtwxcs*-15;

		//施工队表扬评分
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_byjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and bydxlxbm='1' and bylxbm='01'";//01：媒体
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			mtby=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_byjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and bydxlxbm='1' and bylxbm='02'";//02：信件
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjby=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_byjl";
		ls_sql+=" where slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and bydxlxbm='1' and bylxbm='03'";//03：造假
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			byzj=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//表扬：媒体+5分；信件+1分；造假-5分
		bypf=mtby*5+xjby*1+byzj*-5;
	

		//样板间评分
		ybjpf=0;
		ls_sql=" select ybjpf";
		ls_sql+=" from  kp_ybjkp";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ybjpf=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		
		//保存评分
		ls_sql=" update kp_sgdkpjg set qwwz=?,yzwz=?,tbyzwz=?,qttscs=?,tspf=?,wxjslx=?,wxwjslx=?,fygdwx=?,qtwxcs=?,wxpf=? ,mtby=?,xjby=?,byzj=?,bypf=?,ybjpf=?";
		ls_sql+=" where sgd='"+sgd+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,qwwz);
		ps.setInt(2,yzwz);
		ps.setInt(3,tbyzwz);
		ps.setInt(4,qttscs);
		ps.setInt(5,tspf);

		ps.setInt(6,wxjslx);
		ps.setInt(7,wxwjslx);
		ps.setInt(8,fygdwx);
		ps.setInt(9,qtwxcs);
		ps.setInt(10,wxpf);

		ps.setInt(11,mtby);
		ps.setInt(12,xjby);
		ps.setInt(13,byzj);
		ps.setInt(14,bypf);

		ps.setInt(15,ybjpf);
		
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	int	tspf1=0;
	int	tspf2=0;
	int	wxpf1=0;
	int	wxpf2=0;
	int	bypf1=0;
	int	bypf2=0;
	int	ybjpf1=0;
	int	ybjpf2=0;

	int tsdf=0;
	int wxdf=0;
	int bydf=0;
	int ybjdf=0;

	//逐条计算得分：施工队某项得分=（考评分-最低考评分）÷（最高考评分-最低考评分）×该项满分
	//取最大最小值
	ls_sql=" select max(tspf),min(tspf),max(wxpf),min(wxpf),max(bypf),min(bypf),max(ybjpf),min(ybjpf)";
	ls_sql+=" from  kp_sgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		tspf1=rs1.getInt(1);
		tspf2=rs1.getInt(2);
		wxpf1=rs1.getInt(3);
		wxpf2=rs1.getInt(4);
		bypf1=rs1.getInt(5);
		bypf2=rs1.getInt(6);
		ybjpf1=rs1.getInt(7);
		ybjpf2=rs1.getInt(8);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select sgd,tspf,wxpf,bypf,ybjpf";
	ls_sql+=" from  kp_sgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");
		tspf=rs1.getInt("tspf");
		wxpf=rs1.getInt("wxpf");
		bypf=rs1.getInt("bypf");
		ybjpf=rs1.getInt("ybjpf");

		//投诉得分
		if (tspf1-tspf2==0)
		{
			tsdf=0;
		}
		else{
			tsdf=(int)java.lang.Math.round((tspf-tspf2)*20.0/(tspf1-tspf2));
		}
		//维修得分
		if (wxpf1-wxpf2==0)
		{
			wxdf=0;
		}
		else{
			wxdf=(int)java.lang.Math.round((wxpf-wxpf2)*12.0/(wxpf1-wxpf2));
		}
		//表扬得分
		if (bypf1-bypf2==0)
		{
			bydf=0;
		}
		else{
			bydf=(int)java.lang.Math.round((bypf-bypf2)*8.0/(bypf1-bypf2));
		}
		//样板间得分
		if (ybjpf1-ybjpf2==0)
		{
			ybjdf=0;
		}
		else{
			ybjdf=(int)java.lang.Math.round((ybjpf-ybjpf2)*7.0/(ybjpf1-ybjpf2));
		}

		//保存得分
		ls_sql=" update kp_sgdkpjg set tsdf=?,wxdf=?,bydf=?,ybjdf=?";
		ls_sql+=" where sgd='"+sgd+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,tsdf);
		ps.setInt(2,wxdf);
		ps.setInt(3,bydf);
		ps.setInt(4,ybjdf);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();

	//保存总分
	ls_sql=" update kp_sgdkpjg set zf=zjydf+xjydf+gsccdf+khpjdf+wghfdf+phdf+tsdf+wxdf+bydf+ybjdf";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//总分排名
	int zf=0;
	int zfpm=0;
	int sqpm=0;
	int bqpm=0;
	int oldzf=0;
	ls_sql=" select sgd,zf";
	ls_sql+=" from  kp_sgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ls_sql+=" order by zf desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");
		zf=rs1.getInt("zf");

		if (oldzf!=zf)
		{
			oldzf=zf;
			zfpm++;
		}
		
		//上期排名
		int oldkpjlh=0;
		ls_sql=" select max(kpjlh)";
		ls_sql+=" from  kp_kpjl";
		ls_sql+=" where kpjlh<"+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldkpjlh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//上期排名
		if (oldkpjlh==0)
		{
			sqpm=0;
		}
		else{
			ls_sql=" select bqpm";
			ls_sql+=" from  kp_sgdkpjg";
			ls_sql+=" where sgd='"+sgd+"' and kpjlh="+oldkpjlh;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				sqpm=rs.getInt(1);
			}
			rs.close();
			ps.close();
		}

		//保存总分排名、上期排名
		ls_sql=" update kp_sgdkpjg set zfpm=?,sqpm=?,bqpm=?";
		ls_sql+=" where sgd='"+sgd+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zfpm);
		ps.setInt(2,sqpm);
		ps.setInt(3,bqpm);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	
	
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("操作失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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