<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String dqbm=(String)session.getAttribute("dqbm");
String yhdwbh=(String)session.getAttribute("dwbh");

String jcddglbz=(String)session.getAttribute("jcddglbz");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_jjzjx_ddbh=null;
	String jc_jjzjx_zjxxh=null;
	String jc_jjzjx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_zjxm=null;
	String jc_jjzjx_zjxyybm=null;
	String jc_jjzjx_qrsj=null;
	String jc_jjzjx_qrr=null;
	String jc_jjzjx_srksj=null;
	String jc_jjzjx_rkr=null;
	String jc_jjzjx_jhazsj=null;
	String jc_jjzjx_azwcsj=null;
	String jc_jjzjx_clzt=null;
	String jc_jjzjx_lrr=null;
	String jc_jjzjx_lrsj=null;
	String jc_jjzjx_dwbh=null;

	String zjxfssj=null;
	zjxfssj=request.getParameter("zjxfssj");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_jjzjx.zjxfssj>=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}
	zjxfssj=request.getParameter("zjxfssj2");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_jjzjx.zjxfssj<=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}

	String pdgc=null;
	pdgc=request.getParameter("pdgc");
	if (pdgc!=null)
	{
		if (!(pdgc.equals("")))	wheresql+=" and  (jc_jjzjx.pdgc='"+pdgc+"')";
	}
	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_jjzjx.pdgcmc like '%"+pdgcmc+"%')";
	}
	String jjppmc=null;
	jjppmc=request.getParameter("jjppmc");
	if (jjppmc!=null)
	{
		jjppmc=cf.GB2Uni(jjppmc);
		if (!(jjppmc.equals("")))	wheresql+=" and  (jc_jjzjx.jjppmc='"+jjppmc+"')";
	}
	String jjppmc2=null;
	jjppmc2=request.getParameter("jjppmc2");
	if (jjppmc2!=null)
	{
		jjppmc2=cf.GB2Uni(jjppmc2);
		if (!(jjppmc2.equals("")))	wheresql+=" and  (jc_jjzjx.jjppmc like '%"+jjppmc2+"%')";
	}
	String jjgys=null;
	jjgys=request.getParameter("jjgys");
	if (jjgys!=null)
	{
		jjgys=cf.GB2Uni(jjgys);
		if (!(jjgys.equals("")))	wheresql+=" and  (jc_jjzjx.jjgys='"+jjgys+"')";
	}
	String jjgys2=null;
	jjgys2=request.getParameter("jjgys2");
	if (jjgys2!=null)
	{
		jjgys2=cf.GB2Uni(jjgys2);
		if (!(jjgys2.equals("")))	wheresql+=" and  (jc_jjzjx.jjgys like '%"+jjgys2+"%')";
	}

	
	String xcmgc=null;
	xcmgc=request.getParameter("xcmgc");
	if (xcmgc!=null)
	{
		if (!(xcmgc.equals("")))	wheresql+=" and  (jc_jjzjx.xcmgc='"+xcmgc+"')";
	}
	String xcmgcmc=null;
	xcmgcmc=request.getParameter("xcmgcmc");
	if (xcmgcmc!=null)
	{
		xcmgcmc=cf.GB2Uni(xcmgcmc);
		if (!(xcmgcmc.equals("")))	wheresql+=" and  (jc_jjzjx.xcmgcmc like '%"+xcmgcmc+"%')";
	}
	String xcmppmc=null;
	xcmppmc=request.getParameter("xcmppmc");
	if (xcmppmc!=null)
	{
		xcmppmc=cf.GB2Uni(xcmppmc);
		if (!(xcmppmc.equals("")))	wheresql+=" and  (jc_jjzjx.xcmppmc='"+xcmppmc+"')";
	}
	String xcmppmc2=null;
	xcmppmc2=request.getParameter("xcmppmc2");
	if (xcmppmc2!=null)
	{
		xcmppmc2=cf.GB2Uni(xcmppmc2);
		if (!(xcmppmc2.equals("")))	wheresql+=" and  (jc_jjzjx.xcmppmc like '%"+xcmppmc2+"%')";
	}
	String xcmgys=null;
	xcmgys=request.getParameter("xcmgys");
	if (xcmgys!=null)
	{
		xcmgys=cf.GB2Uni(xcmgys);
		if (!(xcmgys.equals("")))	wheresql+=" and  (jc_jjzjx.xcmgys='"+xcmgys+"')";
	}
	String xcmgys2=null;
	xcmgys2=request.getParameter("xcmgys2");
	if (xcmgys2!=null)
	{
		xcmgys2=cf.GB2Uni(xcmgys2);
		if (!(xcmgys2.equals("")))	wheresql+=" and  (jc_jjzjx.xcmgys like '%"+xcmgys2+"%')";
	}

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_jjzjx_ddbh=request.getParameter("jc_jjzjx_ddbh");
	if (jc_jjzjx_ddbh!=null)
	{
		jc_jjzjx_ddbh=cf.GB2Uni(jc_jjzjx_ddbh);
		if (!(jc_jjzjx_ddbh.equals("")))	wheresql+=" and  (jc_jjzjx.ddbh='"+jc_jjzjx_ddbh+"')";
	}
	jc_jjzjx_zjxxh=request.getParameter("jc_jjzjx_zjxxh");
	if (jc_jjzjx_zjxxh!=null)
	{
		jc_jjzjx_zjxxh=jc_jjzjx_zjxxh.trim();
		if (!(jc_jjzjx_zjxxh.equals("")))	wheresql+=" and (jc_jjzjx.zjxxh="+jc_jjzjx_zjxxh+") ";
	}
	jc_jjzjx_khbh=request.getParameter("jc_jjzjx_khbh");
	if (jc_jjzjx_khbh!=null)
	{
		jc_jjzjx_khbh=cf.GB2Uni(jc_jjzjx_khbh);
		if (!(jc_jjzjx_khbh.equals("")))	wheresql+=" and  (jc_jjzjx.khbh='"+jc_jjzjx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	jc_jjzjx_zjxyybm=request.getParameter("jc_jjzjx_zjxyybm");
	if (jc_jjzjx_zjxyybm!=null)
	{
		jc_jjzjx_zjxyybm=cf.GB2Uni(jc_jjzjx_zjxyybm);
		if (!(jc_jjzjx_zjxyybm.equals("")))	wheresql+=" and  (jc_jjzjx.zjxyybm='"+jc_jjzjx_zjxyybm+"')";
	}
	jc_jjzjx_qrsj=request.getParameter("jc_jjzjx_qrsj");
	if (jc_jjzjx_qrsj!=null)
	{
		jc_jjzjx_qrsj=jc_jjzjx_qrsj.trim();
		if (!(jc_jjzjx_qrsj.equals("")))	wheresql+="  and (jc_jjzjx.qrsj=TO_DATE('"+jc_jjzjx_qrsj+"','YYYY/MM/DD'))";
	}
	jc_jjzjx_qrr=request.getParameter("jc_jjzjx_qrr");
	if (jc_jjzjx_qrr!=null)
	{
		jc_jjzjx_qrr=cf.GB2Uni(jc_jjzjx_qrr);
		if (!(jc_jjzjx_qrr.equals("")))	wheresql+=" and  (jc_jjzjx.qrr='"+jc_jjzjx_qrr+"')";
	}
	jc_jjzjx_srksj=request.getParameter("jc_jjzjx_srksj");
	if (jc_jjzjx_srksj!=null)
	{
		jc_jjzjx_srksj=jc_jjzjx_srksj.trim();
		if (!(jc_jjzjx_srksj.equals("")))	wheresql+="  and (jc_jjzjx.srksj=TO_DATE('"+jc_jjzjx_srksj+"','YYYY/MM/DD'))";
	}
	jc_jjzjx_rkr=request.getParameter("jc_jjzjx_rkr");
	if (jc_jjzjx_rkr!=null)
	{
		jc_jjzjx_rkr=cf.GB2Uni(jc_jjzjx_rkr);
		if (!(jc_jjzjx_rkr.equals("")))	wheresql+=" and  (jc_jjzjx.rkr='"+jc_jjzjx_rkr+"')";
	}
	jc_jjzjx_jhazsj=request.getParameter("jc_jjzjx_jhazsj");
	if (jc_jjzjx_jhazsj!=null)
	{
		jc_jjzjx_jhazsj=jc_jjzjx_jhazsj.trim();
		if (!(jc_jjzjx_jhazsj.equals("")))	wheresql+="  and (jc_jjzjx.jhazsj=TO_DATE('"+jc_jjzjx_jhazsj+"','YYYY/MM/DD'))";
	}
	jc_jjzjx_azwcsj=request.getParameter("jc_jjzjx_azwcsj");
	if (jc_jjzjx_azwcsj!=null)
	{
		jc_jjzjx_azwcsj=jc_jjzjx_azwcsj.trim();
		if (!(jc_jjzjx_azwcsj.equals("")))	wheresql+="  and (jc_jjzjx.azwcsj=TO_DATE('"+jc_jjzjx_azwcsj+"','YYYY/MM/DD'))";
	}
	jc_jjzjx_clzt=request.getParameter("jc_jjzjx_clzt");
	if (jc_jjzjx_clzt!=null)
	{
		jc_jjzjx_clzt=cf.GB2Uni(jc_jjzjx_clzt);
		if (!(jc_jjzjx_clzt.equals("")))	wheresql+=" and  (jc_jjzjx.clzt='"+jc_jjzjx_clzt+"')";
	}
	jc_jjzjx_lrr=request.getParameter("jc_jjzjx_lrr");
	if (jc_jjzjx_lrr!=null)
	{
		jc_jjzjx_lrr=cf.GB2Uni(jc_jjzjx_lrr);
		if (!(jc_jjzjx_lrr.equals("")))	wheresql+=" and  (jc_jjzjx.lrr='"+jc_jjzjx_lrr+"')";
	}
	jc_jjzjx_lrsj=request.getParameter("jc_jjzjx_lrsj");
	if (jc_jjzjx_lrsj!=null)
	{
		jc_jjzjx_lrsj=jc_jjzjx_lrsj.trim();
		if (!(jc_jjzjx_lrsj.equals("")))	wheresql+="  and (jc_jjzjx.lrsj>=TO_DATE('"+jc_jjzjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjzjx_lrsj=request.getParameter("jc_jjzjx_lrsj2");
	if (jc_jjzjx_lrsj!=null)
	{
		jc_jjzjx_lrsj=jc_jjzjx_lrsj.trim();
		if (!(jc_jjzjx_lrsj.equals("")))	wheresql+="  and (jc_jjzjx.lrsj<=TO_DATE('"+jc_jjzjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjzjx_dwbh=request.getParameter("jc_jjzjx_dwbh");
	if (jc_jjzjx_dwbh!=null)
	{
		jc_jjzjx_dwbh=cf.GB2Uni(jc_jjzjx_dwbh);
		if (!(jc_jjzjx_dwbh.equals("")))	wheresql+=" and  (jc_jjzjx.dwbh='"+jc_jjzjx_dwbh+"')";
	}
	ls_sql="SELECT jc_jjzjx.zjxxh,jc_jjzjx.ddbh,DECODE(jc_jjzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','04','��װ���','99','�˵�'),crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,jc_jjzjx.pdgc,jc_jjzjx.xcmgc,mmzjxyymc,TO_CHAR(jc_jjzjx.jjzkl) jjzkl,jc_jjzjx.dzyy,jc_jjzjx.jjzjxje,jc_jjzjx.xcmzjxje,jc_jjzjx.cpjjzjxje,jc_jjzjx.zjxze,jc_jjzjx.zqjjzjxje,jc_jjzjx.zqxcmzjxje,jc_jjzjx.zqcpjjzjxje,jc_jjzjx.zqzjxze,jc_jjzjx.qrsj,jc_jjzjx.qrr,jc_jjzjx.srksj,jc_jjzjx.rkr,jc_jjzjx.rksm,jc_jjzjx.jhazsj,jc_jjzjx.azwcsj,jc_jjzjx.zjxfssj,jc_jjzjx.lrr,jc_jjzjx.lrsj,dwmc,jc_jjzjx.bz,jc_jjzjx.khbh  ";
	ls_sql+=" FROM crm_khxx,jc_jjzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_jjzjx.dwbh=sq_dwxx.dwbh and jc_jjzjx.zjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_jjzjx.khbh=crm_khxx.khbh";

	if (zwbm.equals("08"))//08:�Ҿӹ���
	{
		ls_sql+=" and (jc_jjzjx.clgw='"+yhmc+"' OR jc_jjzjx.ztjjgw='"+yhmc+"' OR jc_jjzjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:�Ҿ����ʦ
	{
		ls_sql+=" and (jc_jjzjx.jjsjs='"+yhmc+"' OR jc_jjzjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:��ĿרԱ
	{
		ls_sql+=" and (jc_jjzjx.xmzy='"+yhmc+"' OR jc_jjzjx.lrr='"+yhmc+"')";
	}
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and jc_jjzjx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and dqbm='"+dqbm+"')";
	}
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and (jc_jjzjx.jjgys=(select gys from sq_gysbm where gysbm='"+yhdwbh+"') OR jc_jjzjx.xcmgys=(select gys from sq_gysbm where gysbm='"+yhdwbh+"'))";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by jc_jjzjx.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jjzjxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","zjxxh","jc_jjzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_jjzjx_zjxyybm","jc_jjzjx_jjzjxje","jc_jjzjx_xcmzjxje","jc_jjzjx_wjzjxje","jc_jjzjx_dqzjxje","jc_jjzjx_zjxze","jc_jjzjx_qrsj","jc_jjzjx_qrr","jc_jjzjx_srksj","jc_jjzjx_rkr","jc_jjzjx_rksm","jc_jjzjx_jhazsj","jc_jjzjx_azwcsj","jc_jjzjx_clzt","jc_jjzjx_lrr","jc_jjzjx_lrsj","jc_jjzjx_dwbh","jc_jjzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewJc_jjzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ�������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���������</td>
	<td  width="2%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">�Ҿ߹���</td>
	<td  width="2%">�Ͳ��Ź���</td>
	<td  width="4%">������ԭ��</td>
	<td  width="2%">�ۿ���</td>
	<td  width="7%">����ԭ��</td>
	<td  width="3%"><font color="#0000CC"><strong>�Ҿ���������-�ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>�Ͳ�����������-�ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>��Ʒ�Ҿ���������-�ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>�������ܶ�-�ۺ�</strong></font></td>
	<td  width="3%"><strong>�Ҿ���������-��ǰ</strong></td>
	<td  width="3%"><strong>�Ͳ�����������-��ǰ</strong></td>
	<td  width="3%"><strong>��Ʒ�Ҿ���������-��ǰ</strong></td>
	<td  width="3%"><strong>�������ܶ�-��ǰ</strong></td>
	<td  width="3%">ȷ��ʱ��</td>
	<td  width="2%">ȷ��¼����</td>
	<td  width="3%">ʵ���ʱ��</td>
	<td  width="2%">���¼����</td>
	<td  width="5%">���˵��</td>
	<td  width="3%">�ƻ���װʱ��</td>
	<td  width="3%">��װ���ʱ��</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="11%">��ע</td>
	<td  width="2%">�ͻ����</td>
</tr>

<%
	pageObj.printDateSum();
	pageObj.printFoot();
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