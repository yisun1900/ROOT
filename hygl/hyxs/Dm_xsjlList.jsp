<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="hygl" scope="page" class="hygl.Hygl"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ls_sql=null;
String wheresql=" WHERE (dm_xsjl.dwbh=sq_dwxx.dwbh) ";
int curPage=0;
String pageStr=request.getParameter("curPage");
String xsrq=null;
String xsrq2=null;
String dwbh=null;

if (pageStr!=null)//��x������
{
	//Ҫ����ʾ�ڼ�ҳ
	curPage=Integer.parseInt(pageStr);
	String chooseitem = request.getParameter("chooseitem");
	if ((chooseitem!=null)&&(!(chooseitem.equals(""))))//ִ��ɾ������
	{
//		out.println("<BR>ls_sql="+ls_sql);
		Connection conn=null;    //�õ�����
		PreparedStatement ps=null;
		ResultSet rs=null;
		PreparedStatement ps1=null;
		ResultSet rs1=null;
		PreparedStatement ps2=null;
		ResultSet rs2=null;
		String sql="";
		
		try{
			conn=cf.getConnection();    //�õ�����
			conn.setAutoCommit(false);
			String cpbm="",khbh="",ywxh="",ckbm="",ckph="",rkph="",bkbh="";
			String hjbm=null;
			float rkj=0,sxj=0;
			boolean success=true;
			//�����ۼ�¼����ȡ����λ��š���Ʒ���롢�ͻ���š�ʵ���ۡ�ҵ����š���������
			sql="select dwbh,cpbm,khbh,sxj,ywxh,TO_CHAR(xsrq,'YYYY-MM-DD'),ckbm,hjbm ";
			sql+="  from dm_xsjl where "+chooseitem;
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			while(rs1.next()){
				dwbh=rs1.getString(1);
				cpbm=rs1.getString(2);
				khbh=rs1.getString(3);
				sxj=rs1.getFloat(4);
				ywxh=rs1.getString(5);
				xsrq=rs1.getString(6);
				ckbm=rs1.getString(7);
				hjbm=rs1.getString(8);

				
				sql="select cpbm FROM cp_cpxx1 ";
				sql+=" WHERE cpbm='"+cpbm+"' and wlzt='05' ";
				sql+=" and szdw='"+dwbh+"' and ckbm='"+ckbm+"' and hjbm='"+hjbm+"'";
				ps=conn.prepareStatement(sql);  
				rs=ps.executeQuery();
				if (rs.next()){
				}
				else{
					conn.rollback();
					out.println("�����޲�Ʒ���������Ѹı�״̬����Ʒ����="+cpbm);
					return;
				}
				rs.close();
				ps.close();

				
				//�޸Ĳ�Ʒ��Ϣ
				sql="update cp_cpxx1 set ywxh=null,wlzt='00',xsrq=null,sxj=null,jyfs=null,khlx=null,khbh=null";
				sql+=" where cpbm='"+cpbm+"'";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
				
				//�����۵Ĳ�Ʒ��Ϣ��cp_cpxx1��cp_cpstxx1�����Ƶ�cp_cpxx��cp_cpstxx��
				sql  =  " insert into cp_cpxx";
				sql +=  " select * ";
				sql +=  " from cp_cpxx1 where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				sql  =  " insert into cp_cpstxx";
				sql +=  " select * from cp_cpstxx1 where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				sql =  " delete from cp_cpstxx1 where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				sql =  " delete from cp_cpxx1 where  cpbm=? ";
				ps=conn.prepareStatement(sql);  
				ps.setString(1,cpbm);
				ps.executeUpdate();
				ps.close();

				//�޸Ļ�Ա��Ϣ�ͻ�Ա���Ѽ�¼
				if(khbh!=null){
					hygl.deleteJf(conn,ywxh,cpbm,out);
				}
				
				String zp_ckbm="",zpbm="",zp_ckph="";
				String zpwlzt=null;
				float zp_ckj=0;


				long xh=0;
				String zplx=null;
				//���ݲ�Ʒ����Ӹ�����Ʒ���в�ѯ������Ʒ��Ϣ
				sql="select xh,zpbm,zplx,ckbm from dm_zpxs ";
				sql+="  where  ywxh='"+ywxh+"' and cpbm='"+cpbm+"'";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					xh=rs.getLong(1);
					zpbm=rs.getString(2);
					zplx=rs.getString(3);
					zp_ckbm=rs.getString(4);
					
					//��ѯ����״̬
					sql="select wlzt from xt_ckxx where ckbm='"+zp_ckbm+"'";
					ps2=conn.prepareStatement(sql);
					rs2=ps2.executeQuery();
					if(rs2.next()){
						zpwlzt=rs2.getString(1);
					}
					rs2.close();
					ps2.close();

					
					
					int count=0;
					sql="select count(*) from cp_zpkc ";
					sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
					ps2=conn.prepareStatement(sql);
					rs2=ps2.executeQuery();
					if (rs2.next())
					{
						count=rs2.getInt(1);
					}
					rs2.close();
					ps2.close();
					if (count==0)
					{
						//������Ʒ���
						sql="insert into cp_zpkc(zpbm,ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx) ";
						sql+="  select zpbm,ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx";
						sql+="  from dm_zpxs ";
						sql+="  where  ywxh='"+ywxh+"' and cpbm='"+cpbm+"' and xh="+xh;
						//out.println(sql);
						ps2=conn.prepareStatement(sql);  
						ps2.executeUpdate();
						ps2.close();
					}
					else{
						//�޸���Ʒ��棬
						sql="update cp_zpkc set sl=sl+1 ";
						sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
						//out.println(sql);
						ps2=conn.prepareStatement(sql);  
						ps2.executeUpdate();
						ps2.close();
					}
					if (zplx.equals("1"))
					{
						//�޸Ĳ�Ʒ��Ϣ
						sql="update cp_cpxx1 set ywxh=null,wlzt='"+zpwlzt+"',xsrq=null,sxj=null,jyfs=null,khlx=null,khbh=null";
						sql+=" where cpbm='"+zpbm+"'";
						ps2=conn.prepareStatement(sql);
						ps2.executeUpdate();
						ps2.close();

						//�����۵Ĳ�Ʒ��Ϣ��cp_cpxx1��cp_cpstxx1�����Ƶ�cp_cpxx��cp_cpstxx��
						sql  =  " insert into cp_cpxx";
						sql +=  " select * ";
						sql +=  " from cp_cpxx1 where  cpbm=? ";
						ps2=conn.prepareStatement(sql);  
						ps2.setString(1,cpbm);
						ps2.executeUpdate();
						ps2.close();

						sql  =  " insert into cp_cpstxx";
						sql +=  " select * from cp_cpstxx1 where  cpbm=? ";
						ps2=conn.prepareStatement(sql);  
						ps2.setString(1,cpbm);
						ps2.executeUpdate();
						ps2.close();

						sql =  " delete from cp_cpstxx1 where  cpbm=? ";
						ps2=conn.prepareStatement(sql);  
						ps2.setString(1,cpbm);
						ps2.executeUpdate();
						ps2.close();

						sql =  " delete from cp_cpxx1 where  cpbm=? ";
						ps2=conn.prepareStatement(sql);  
						ps2.setString(1,cpbm);
						ps2.executeUpdate();
						ps2.close();
					}

				}//end while loop
				rs.close();
				ps.close();

				//ɾ����Ʒ���ۼ�¼
				sql="delete from dm_zpxs where  ywxh='"+ywxh+"' and cpbm='"+cpbm+"'";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
			}
			rs1.close();
			ps1.close();

			//ɾ��dm_xsjl
			sql="delete from dm_xsjl where "+chooseitem;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			conn.commit();
		}
		catch(Exception e){
			conn.rollback();
			out.println("<BR>ִ�г���"+e);
			out.println("<BR>sql="+sql);
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
				  out.println("���ݿ����ʧ�ܣ�"+e.getMessage());
			}
		}
		pageObject.afterDelete();
	}
}
else//��һ������,��Ҫ��ѯ
{
	curPage=1;
	String ywxh=null;
	String cpbm=null;
	String zkl=null;
	String sjzkl=null;
	String khlx=null;
	String khbh=null;
	String jyfs=null;
	String czy=null;
	String zkcx=null;
	String shbz=null;
	String shr=null;
	String shrq=null;
	String sfjs=null;

	String bkbh=null;
	String plbm=null;
	String pmbm=null;
	String cplb=null;
	String jlzl=null;
	String zszl=null;
	String pszl=null;
	String lsj=null;
	String bqj=null;
	String sxj=null;
	String lrrq=null;
	String lrrq2=null;
	xsrq=request.getParameter("xsrq");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and dm_xsjl.xsrq>=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
	xsrq2=request.getParameter("xsrq2");
	if (xsrq2!=null)
	{
		xsrq2=xsrq2.trim();
		if (!(xsrq2.equals("")))	wheresql+="  and dm_xsjl.xsrq<=TO_DATE('"+xsrq2+"','YYYY-MM-DD')";
	}
	lrrq=request.getParameter("lrrq");
	if (lrrq!=null)
	{
		if (!(lrrq.equals("")))	wheresql+="  and dm_xsjl.lrrq>=TO_DATE('"+lrrq+"','YYYY-MM-DD')";
	}
	lrrq2=request.getParameter("lrrq2");
	if (lrrq2!=null)
	{
		if (!(lrrq2.equals("")))	wheresql+="  and dm_xsjl.lrrq<=TO_DATE('"+lrrq2+"','YYYY-MM-DD')";
	}

	String gmyy=null;
	String gmyjbm=null;
	gmyy=request.getParameter("gmyy");
	if (gmyy!=null)
	{
		if (!(gmyy.equals("")))	wheresql+="  and (dm_xsjl.gmyy='"+gmyy+"')";
	}
	gmyjbm=request.getParameter("gmyjbm");
	if (gmyjbm!=null)
	{
		if (!(gmyjbm.equals("")))	wheresql+="  and (dm_xsjl.gmyjbm='"+gmyjbm+"')";
	}

	String jwbm=null;
	String xsbddbh=null;
	jwbm=request.getParameter("jwbm");
	if (jwbm!=null)
	{
		if (!(jwbm.equals("")))	wheresql+="  and (dm_xsjl.jwbm='"+jwbm+"')";
	}
	xsbddbh=request.getParameter("xsbddbh");
	if (xsbddbh!=null)
	{
		if (!(xsbddbh.equals("")))	wheresql+="  and (dm_xsjl.xsbddbh='"+xsbddbh+"')";
	}


	bkbh=request.getParameter("bkbh");
	if (bkbh!=null)
	{
		bkbh=cf.GB2Uni(bkbh);
		if (!(bkbh.equals("")))	wheresql+="  and (bkbh='"+bkbh+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		plbm=cf.GB2Uni(plbm);
		if (!(plbm.equals("")))	wheresql+="  and (plbm='"+plbm+"')";
	}
	pmbm=request.getParameter("pmbm");
	if (pmbm!=null)
	{
		pmbm=cf.GB2Uni(pmbm);
		if (!(pmbm.equals("")))	wheresql+="  and (pmbm='"+pmbm+"')";
	}
	cplb=request.getParameter("cplb");
	if (cplb!=null)
	{
		cplb=cf.GB2Uni(cplb);
		if (!(cplb.equals("")))	wheresql+="  and (cplb='"+cplb+"')";
	}

	jlzl=request.getParameter("jlzl");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl>="+jlzl+") ";
	}
	jlzl=request.getParameter("jlzl2");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl<="+jlzl+") ";
	}
	zszl=request.getParameter("zszl");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl>="+zszl+") ";
	}
	zszl=request.getParameter("zszl2");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl<="+zszl+") ";
	}
	pszl=request.getParameter("pszl");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl>="+pszl+") ";
	}
	pszl=request.getParameter("pszl2");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl<="+pszl+") ";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj<="+lsj+") ";
	}
	bqj=request.getParameter("bqj");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj>="+bqj+") ";
	}
	bqj=request.getParameter("bqj2");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj<="+bqj+") ";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj>="+sxj+") ";
	}
	sxj=request.getParameter("sxj2");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj<="+sxj+") ";
	}


	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+="  and (dm_xsjl.dwbh='"+dwbh+"')";
	}
	ywxh=request.getParameter("ywxh");
	if (ywxh!=null)
	{
		ywxh=cf.GB2Uni(ywxh);
		if (!(ywxh.equals("")))	wheresql+="  and (dm_xsjl.ywxh='"+ywxh+"')";
	}
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+="  and (dm_xsjl.cpbm='"+cpbm+"')";
	}
	zkl=request.getParameter("zkl");
	if (zkl!=null)
	{
		zkl=zkl.trim();
		if (!(zkl.equals("")))	wheresql+=" and  (zkl="+zkl+") ";
	}
	sjzkl=request.getParameter("sjzkl");
	if (sjzkl!=null)
	{
		sjzkl=sjzkl.trim();
		if (!(sjzkl.equals("")))	wheresql+=" and  (dm_xsjl.sjzkl="+sjzkl+") ";
	}
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+="  and (dm_xsjl.khlx='"+khlx+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (dm_xsjl.khbh='"+khbh+"')";
	}
	jyfs=request.getParameter("jyfs");
	if (jyfs!=null)
	{
		jyfs=cf.GB2Uni(jyfs);
		if (!(jyfs.equals("")))	wheresql+="  and (dm_xsjl.jyfs='"+jyfs+"')";
	}
	czy=request.getParameter("czy");
	if (czy!=null)
	{
		czy=cf.GB2Uni(czy);
		if (!(czy.equals("")))	wheresql+="  and (czy='"+czy+"')";
	}
	zkcx=request.getParameter("zkcx");
	if (zkcx!=null)
	{
		zkcx=cf.GB2Uni(zkcx);
		if (!(zkcx.equals("")))	wheresql+="  and (dm_xsjl.zkcx='"+zkcx+"')";
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
		if (!(shrq.equals("")))	wheresql+="  and dm_xsjl.shrq=TO_DATE('"+shrq+"','YYYY/MM/DD')";
	}
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=sfjs.trim();
		if (!(sfjs.equals("")))	wheresql+=" and (sfjs="+sfjs+") ";
	}

	if (yhjs.equals("00"))//00���ܹ�˾
	{
		ls_sql="SELECT dm_xsjl.ywxh ywxh,dm_xsjl.cpbm cpbm,DECODE(cplb,'B','�ؽ�','A','��Ƕ'),bkbh,plbm,dwmc,dm_xsjl.khbh  ,ysj,lsj,dm_xsjl.bqj,dm_xsjl.sxj,TO_CHAR(dm_xsjl.sjzkl),DECODE(sfjs,0,'��',1,'��')";
	}
	else{
		ls_sql="SELECT dm_xsjl.ywxh ywxh,dm_xsjl.cpbm cpbm,DECODE(cplb,'B','�ؽ�','A','��Ƕ'),bkbh,plbm,dwmc,dm_xsjl.khbh  ,0,0,dm_xsjl.bqj,dm_xsjl.sxj,TO_CHAR(dm_xsjl.sjzkl),DECODE(sfjs,0,'��',1,'��')";
	}
	ls_sql+=" FROM dm_xsjl,sq_dwxx ";
    ls_sql+=wheresql;
	ls_sql+=" order by dm_xsjl.dwbh,ywxh";
//	out.println(ls_sql);
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("Dm_xsjlList.jsp","SelectDm_xsjl.jsp","","");

//��������
	String[] keyName={"ywxh","cpbm"};
	pageObject.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_xsjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObject.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ywxh","cpbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewDm_xsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("cpbm",coluParm);//�в����������Hash��
	pageObject.setColuLink(coluParmHash);//�в����������Hash��
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="4%" height="2">&nbsp;</td>
		<td  width="9%" height="2">ҵ�����</td>
		<td  width="11%" height="2">��Ʒ����</td>
		<td  width="5%" height="2">���</td>
		<td  width="9%" height="2">�����</td>
		<td  width="5%" height="2">Ʒ��</td>
		<td  width="15%" height="2">���۵�λ</td>
		<td  width="6%" height="2">��Ա���</td>
		<td  width="6%" height="2">���ۼ�</td>
		<td  width="6%" height="2">���ۼ�</td>
		<td  width="6%" height="2">��ǩ��</td>
		<td  width="7%" height="2">ʵ����</td>
		<td  width="6%" height="2">�ۿ���</td>
		<td  width="4%" height="2">����</td>
</tr>
<%
	pageObject.printDateSum();
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