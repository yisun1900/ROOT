<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String tc_zck_cpbm=null;
	String tc_zck_dqbm=null;
	String tc_zck_bjjbbm=null;
	String tc_zck_nbbm=null;
	String cldl=null;
	String clxl=null;
	String tc_zck_cpmc=null;
	String tc_zck_xh=null;
	String tc_zck_gg=null;
	String tc_zck_ppmc=null;
	String tc_zck_gysmc=null;
	String tc_zck_jldw=null;
	String tc_zck_xdjldw=null;
	String tc_zck_sfxclxs=null;
	String tc_zck_lx=null;
	String tc_zck_lbxmbm=null;
	String tc_zck_cxxmbm=null;
	String tc_zck_sfyx=null;
	String tc_zck_yxkssj=null;
	String tc_zck_yxjzsj=null;
	String tc_zck_lrr=null;
	String tc_zck_lrsj=null;
	tc_zck_cpbm=request.getParameter("tc_zck_cpbm");
	if (tc_zck_cpbm!=null)
	{
		tc_zck_cpbm=cf.GB2Uni(tc_zck_cpbm);
		if (!(tc_zck_cpbm.equals("")))	wheresql+=" and  (tc_zck.cpbm='"+tc_zck_cpbm+"')";
	}
	tc_zck_dqbm=request.getParameter("tc_zck_dqbm");
	if (tc_zck_dqbm!=null)
	{
		tc_zck_dqbm=cf.GB2Uni(tc_zck_dqbm);
		if (!(tc_zck_dqbm.equals("")))	wheresql+=" and  (tc_zck.dqbm='"+tc_zck_dqbm+"')";
	}
	tc_zck_bjjbbm=request.getParameter("tc_zck_bjjbbm");
	if (tc_zck_bjjbbm!=null)
	{
		tc_zck_bjjbbm=cf.GB2Uni(tc_zck_bjjbbm);
		if (!(tc_zck_bjjbbm.equals("")))	wheresql+=" and  (tc_zck.bjjbbm='"+tc_zck_bjjbbm+"')";
	}
	tc_zck_nbbm=request.getParameter("tc_zck_nbbm");
	if (tc_zck_nbbm!=null)
	{
		tc_zck_nbbm=cf.GB2Uni(tc_zck_nbbm);
		if (!(tc_zck_nbbm.equals("")))	wheresql+=" and  (tc_zck.nbbm='"+tc_zck_nbbm+"')";
	}
	cldl=request.getParameter("cldl");
	if (cldl!=null)
	{
		cldl=cf.GB2Uni(cldl);
		if (!(cldl.equals("")))	wheresql+=" and  (tc_zck.cldl='"+cldl+"')";
	}
	clxl=request.getParameter("clxl");
	if (clxl!=null)
	{
		clxl=cf.GB2Uni(clxl);
		if (!(clxl.equals("")))	wheresql+=" and  (tc_zck.clxl='"+clxl+"')";
	}
	tc_zck_cpmc=request.getParameter("tc_zck_cpmc");
	if (tc_zck_cpmc!=null)
	{
		tc_zck_cpmc=cf.GB2Uni(tc_zck_cpmc);
		if (!(tc_zck_cpmc.equals("")))	wheresql+=" and  (tc_zck.cpmc like '%"+tc_zck_cpmc+"%')";
	}
	tc_zck_xh=request.getParameter("tc_zck_xh");
	if (tc_zck_xh!=null)
	{
		tc_zck_xh=cf.GB2Uni(tc_zck_xh);
		if (!(tc_zck_xh.equals("")))	wheresql+=" and  (tc_zck.xh like '%"+tc_zck_xh+"%')";
	}
	tc_zck_gg=request.getParameter("tc_zck_gg");
	if (tc_zck_gg!=null)
	{
		tc_zck_gg=cf.GB2Uni(tc_zck_gg);
		if (!(tc_zck_gg.equals("")))	wheresql+=" and  (tc_zck.gg='"+tc_zck_gg+"')";
	}
	tc_zck_ppmc=request.getParameter("tc_zck_ppmc");
	if (tc_zck_ppmc!=null)
	{
		tc_zck_ppmc=cf.GB2Uni(tc_zck_ppmc);
		if (!(tc_zck_ppmc.equals("")))	wheresql+=" and  (tc_zck.ppmc='"+tc_zck_ppmc+"')";
	}
	tc_zck_gysmc=request.getParameter("tc_zck_gysmc");
	if (tc_zck_gysmc!=null)
	{
		tc_zck_gysmc=cf.GB2Uni(tc_zck_gysmc);
		if (!(tc_zck_gysmc.equals("")))	wheresql+=" and  (tc_zck.gysmc='"+tc_zck_gysmc+"')";
	}
	tc_zck_jldw=request.getParameter("tc_zck_jldw");
	if (tc_zck_jldw!=null)
	{
		tc_zck_jldw=cf.GB2Uni(tc_zck_jldw);
		if (!(tc_zck_jldw.equals("")))	wheresql+=" and  (tc_zck.jldw='"+tc_zck_jldw+"')";
	}
	tc_zck_xdjldw=request.getParameter("tc_zck_xdjldw");
	if (tc_zck_xdjldw!=null)
	{
		tc_zck_xdjldw=cf.GB2Uni(tc_zck_xdjldw);
		if (!(tc_zck_xdjldw.equals("")))	wheresql+=" and  (tc_zck.xdjldw='"+tc_zck_xdjldw+"')";
	}
	tc_zck_sfxclxs=request.getParameter("tc_zck_sfxclxs");
	if (tc_zck_sfxclxs!=null)
	{
		tc_zck_sfxclxs=cf.GB2Uni(tc_zck_sfxclxs);
		if (!(tc_zck_sfxclxs.equals("")))	wheresql+=" and  (tc_zck.sfxclxs='"+tc_zck_sfxclxs+"')";
	}
	tc_zck_lx=request.getParameter("tc_zck_lx");
	if (tc_zck_lx!=null)
	{
		tc_zck_lx=cf.GB2Uni(tc_zck_lx);
		if (!(tc_zck_lx.equals("")))	wheresql+=" and  (tc_zck.lx='"+tc_zck_lx+"')";
	}
	tc_zck_lbxmbm=request.getParameter("tc_zck_lbxmbm");
	if (tc_zck_lbxmbm!=null)
	{
		tc_zck_lbxmbm=cf.GB2Uni(tc_zck_lbxmbm);
		if (!(tc_zck_lbxmbm.equals("")))	wheresql+=" and  (tc_zck.lbxmbm='"+tc_zck_lbxmbm+"')";
	}
	tc_zck_cxxmbm=request.getParameter("tc_zck_cxxmbm");
	if (tc_zck_cxxmbm!=null)
	{
		tc_zck_cxxmbm=cf.GB2Uni(tc_zck_cxxmbm);
		if (!(tc_zck_cxxmbm.equals("")))	wheresql+=" and  (tc_zck.cxxmbm='"+tc_zck_cxxmbm+"')";
	}
	tc_zck_sfyx=request.getParameter("tc_zck_sfyx");
	if (tc_zck_sfyx!=null)
	{
		tc_zck_sfyx=cf.GB2Uni(tc_zck_sfyx);
		if (!(tc_zck_sfyx.equals("")))	wheresql+=" and  (tc_zck.sfyx='"+tc_zck_sfyx+"')";
	}
	tc_zck_yxkssj=request.getParameter("tc_zck_yxkssj");
	if (tc_zck_yxkssj!=null)
	{
		tc_zck_yxkssj=tc_zck_yxkssj.trim();
		if (!(tc_zck_yxkssj.equals("")))	wheresql+="  and (tc_zck.yxkssj>=TO_DATE('"+tc_zck_yxkssj+"','YYYY/MM/DD'))";
	}
	tc_zck_yxkssj=request.getParameter("tc_zck_yxkssj2");
	if (tc_zck_yxkssj!=null)
	{
		tc_zck_yxkssj=tc_zck_yxkssj.trim();
		if (!(tc_zck_yxkssj.equals("")))	wheresql+="  and (tc_zck.yxkssj<=TO_DATE('"+tc_zck_yxkssj+"','YYYY/MM/DD'))";
	}
	tc_zck_yxjzsj=request.getParameter("tc_zck_yxjzsj");
	if (tc_zck_yxjzsj!=null)
	{
		tc_zck_yxjzsj=tc_zck_yxjzsj.trim();
		if (!(tc_zck_yxjzsj.equals("")))	wheresql+="  and (tc_zck.yxjzsj>=TO_DATE('"+tc_zck_yxjzsj+"','YYYY/MM/DD'))";
	}
	tc_zck_yxjzsj=request.getParameter("tc_zck_yxjzsj2");
	if (tc_zck_yxjzsj!=null)
	{
		tc_zck_yxjzsj=tc_zck_yxjzsj.trim();
		if (!(tc_zck_yxjzsj.equals("")))	wheresql+="  and (tc_zck.yxjzsj<=TO_DATE('"+tc_zck_yxjzsj+"','YYYY/MM/DD'))";
	}
	tc_zck_lrr=request.getParameter("tc_zck_lrr");
	if (tc_zck_lrr!=null)
	{
		tc_zck_lrr=cf.GB2Uni(tc_zck_lrr);
		if (!(tc_zck_lrr.equals("")))	wheresql+=" and  (tc_zck.lrr='"+tc_zck_lrr+"')";
	}
	tc_zck_lrsj=request.getParameter("tc_zck_lrsj");
	if (tc_zck_lrsj!=null)
	{
		tc_zck_lrsj=tc_zck_lrsj.trim();
		if (!(tc_zck_lrsj.equals("")))	wheresql+="  and (tc_zck.lrsj>=TO_DATE('"+tc_zck_lrsj+"','YYYY/MM/DD'))";
	}
	tc_zck_lrsj=request.getParameter("tc_zck_lrsj2");
	if (tc_zck_lrsj!=null)
	{
		tc_zck_lrsj=tc_zck_lrsj.trim();
		if (!(tc_zck_lrsj.equals("")))	wheresql+="  and (tc_zck.lrsj<=TO_DATE('"+tc_zck_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_zck.cpbm,dm_dqbm.dqmc,bdm_bjjbbm.bjjbmc,tc_zck.nbbm,tc_zck.cldl,tc_zck.clxl,tc_zck.cpmc,tc_zck.xh,tc_zck.gg,tc_zck.ppmc,tc_zck.gysmc,tc_zck.jldw,tc_zck.xdjldw,tc_zck.xdb,tc_zck.sh, DECODE(tc_zck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������'),tc_zck.jsj,tc_zck.khxsdj,tc_zck.sgddj, DECODE(tc_zck.lx,'1','�ײ���','2','������','3','�����','4','�ײ���'),tc_zck.lbxmbm,tc_zck.cxxmbm, DECODE(tc_zck.sfyx,'1','��������','2','ֹͣ����','3','�׶�����','4','��ǰ��ʵ'),tc_zck.yxkssj,tc_zck.yxjzsj,tc_zck.xuhao,tc_zck.lrr,tc_zck.lrsj,tc_zck.bz,tc_zck.sjj1,tc_zck.sjj2,tc_zck.sjj3,tc_zck.sjj4,tc_zck.sjj5  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_zck  ";
    ls_sql+=" where tc_zck.dqbm=dm_dqbm.dqbm(+) and tc_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_zck.dqbm,tc_zck.bjjbbm,tc_zck.cldl,tc_zck.clxl";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_zckList.jsp","","","EditTc_zck.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cpbm","dm_dqbm_dqmc","bdm_bjjbbm_bjjbmc","tc_zck_nbbm","cldl","clxl","tc_zck_cpmc","tc_zck_xh","tc_zck_gg","tc_zck_ppmc","tc_zck_gysmc","tc_zck_jldw","tc_zck_xdjldw","tc_zck_xdb","tc_zck_sh","tc_zck_sfxclxs","tc_zck_jsj","tc_zck_khxsdj","tc_zck_sgddj","tc_zck_lx","tc_zck_lbxmbm","tc_zck_cxxmbm","tc_zck_sfyx","tc_zck_yxkssj","tc_zck_yxjzsj","tc_zck_xuhao","tc_zck_lrr","tc_zck_lrsj","tc_zck_bz","tc_zck_sjj1","tc_zck_sjj2","tc_zck_sjj3","tc_zck_sjj4","tc_zck_sjj5"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_zckList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from tc_zck where "+chooseitem;
		sql[1]="delete from tc_zcsjj where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
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
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(420);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="2%">����</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">�ڲ�����</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">��ƷС��</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="6%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="4%">Ʒ��</td>
	<td  width="6%">��Ӧ��</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�µ�������λ</td>
	<td  width="2%">�µ���</td>
	<td  width="2%">���</td>
	<td  width="2%">�Ƿ��账��С��</td>
	<td  width="2%">�����</td>
	<td  width="2%">�ͻ����۵���</td>
	<td  width="2%">ʩ���ӵ���</td>
	<td  width="2%">����</td>
	<td  width="3%">�����Ŀ����</td>
	<td  width="3%">������Ŀ����</td>
	<td  width="3%">�Ƿ���Ч</td>
	<td  width="3%">��Ч��ʼʱ��</td>
	<td  width="3%">��Ч����ʱ��</td>
	<td  width="2%">�������</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="6%">��ע</td>
	<td  width="2%">������1</td>
	<td  width="2%">������2</td>
	<td  width="2%">������3</td>
	<td  width="2%">������4</td>
	<td  width="32%">������5</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>