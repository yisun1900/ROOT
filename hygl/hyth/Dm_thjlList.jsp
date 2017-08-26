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

if (pageStr!=null)//��x������
{
	//Ҫ����ʾ�ڼ�ҳ
	curPage=Integer.parseInt(pageStr);
	String chooseitem = request.getParameter("chooseitem");
	if ((chooseitem!=null)&&(!(chooseitem.equals(""))))//ִ��ɾ������
	{
		Connection conn=null;    //�õ�����
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
			conn=cf.getConnection();    //�õ�����
			conn.setAutoCommit(false);

			//�����ۼ�¼����ȡ����λ��š���Ʒ���롢�ͻ���š�ʵ���ۡ�ҵ����š���������
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
					out.println("<BR>�����޲�Ʒ���������Ѹı�״̬����Ʒ����="+cpbm);
					return;
				}
				rs.close();
				ps.close();


				//ȡ���۵�λ�ֿ���Ϣ
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
				

				//�޸Ĳ�Ʒ��Ϣ
				if (thlx.equals("0"))//0���ꣻ
				{
					sql="update cp_cpxx set thjlh=null,wlzt='05',thrq=null,thj=null";
					sql+=" where cpbm='"+cpbm+"'";
				}
				else{//1���
					sql="update cp_cpxx set thjlh=null,wlzt='05',thrq=null,thj=null";
					sql+=" ,szdw='"+xsdwbh+"',ckbm='"+xsckbm+"',hjbm='"+xshjbm+"'";
					sql+=" where cpbm='"+cpbm+"'";
				}
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				//��ѧ�� 2003.9.24 ������ԭ��Ҫ�����۵Ĳ�Ʒ�ŵ�cp_cpxx1��
				//��ɾ�����˻��Ĳ�Ʒ��Ϣ��cp_cpxx��cp_cpstxx�����Ƶ�cp_cpxx1��cp_cpstxx1��
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
				//�������۲�Ʒ��Ϣ���ƶ�

				String zp_ckbm="",zpbm="";

				int xh=0;
				String zplx=null;
				//���ݲ�Ʒ����Ӹ�����Ʒ���в�ѯ������Ʒ��Ϣ
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

					 //�޸���Ʒ��棬���������1��
					 sql="update cp_zpkc set  sl=sl-1 ";
					 sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
//					out.println("<BR>"+sql);
					 ps=conn.prepareStatement(sql);  
					 ps.executeUpdate();
					 ps.close();
					 //ɾ����Ʒ�⣬�������Ϊ0��¼��
					 sql="delete from cp_zpkc ";
					 sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2' and sl=0";   
					 ps=conn.prepareStatement(sql);  
					 ps.executeUpdate();
					 ps.close();
				
					if (zplx.equals("1"))
					{
						//�޸Ĳ�Ʒ��Ϣ
						sql="update cp_cpxx set wlzt='05',thjlh=null,thrq=null,thj=null";
						sql+=" where cpbm='"+zpbm+"'";
						ps=conn.prepareStatement(sql);
						ps.executeUpdate();
						ps.close();

						//��ѧ�� 2003.9.24 ������ԭ��Ҫ�����۵Ĳ�Ʒ�ŵ�cp_cpxx1��
						//�����ɳ�Ʒר�ɵ���Ʒ��Ϣ�������۵Ĳ�Ʒ��Ϣ��cp_cpxx��cp_cpstxx�����Ƶ�cp_cpxx1��cp_cpstxx1��
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
						//�������۲�Ʒ��Ϣ���ƶ�
					}
				}
				rs2.close();
				ps2.close();

				//ɾ����Ʒ���ۼ�¼
				sql="delete from dm_zpth where  thjlh='"+thjlh+"' and cpbm='"+cpbm+"'";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
			
				//�޸Ļ�Ա��Ϣ�ͻ�Ա���Ѽ�¼
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
			out.println("<BR>ִ��pageObject.executeSql(conn,ls_sql)����"+e);
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
				  out.println("���ݿ����ʧ�ܣ�"+e.getMessage());
			}
		}
		pageObject.afterDelete();
	}
}
else//��һ������,��Ҫ��ѯ
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
	ls_sql="SELECT thjlh,cpbm,dwmc,thj,DECODE(thbz,0,'�����˻�',1,'��껻��',2,'����˻�'),thrq,czy,DECODE(sfjs,0,'δ����',1,'����')  ";
	ls_sql+=" FROM dm_thjl,sq_dwxx  ";
    ls_sql+=wheresql;
	ls_sql+=" order by thjlh,cpbm";
//	out.println(ls_sql);
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("Dm_thjlList.jsp","SelectDm_thjl.jsp","ViewDm_thjl.jsp","");
/*
//������ʾ��
	String[] disColName={"thjlh","cpbm","thdw","thj","thbz","thrq","czy"};
	pageObject.setDisColName(disColName);
*/

//��������
	String[] keyName={"thjlh","cpbm"};
	pageObject.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_thjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObject.setButton(buttonName,buttonLink,buttonNew);
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
	pageObject.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%" >&nbsp;</td>
	<td  width="12%" >�˻���¼��</td>
	<td  width="12%" >��Ʒ����</td>
	<td  width="16%" >�˻���λ</td>
	<td  width="10%" >�˻����</td>
	<td  width="10%" >�˻�����</td>
	<td  width="12%" >�˻�����</td>
	<td  width="8%" >����Ա</td>
	<td  width="10%" >�����־</td>
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